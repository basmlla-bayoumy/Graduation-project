import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:g2/models/chat_bubble_model.dart';
import 'package:g2/models/chat_model.dart';
import 'package:g2/services/fastApi_connection.dart';
import 'package:g2/widgets/bottom_sheet_camera.dart';
import 'package:g2/widgets/chat_bubble_widget.dart';

class AddNewChatScreen extends StatefulWidget {
  const AddNewChatScreen({super.key});

  @override
  State<AddNewChatScreen> createState() => _AddNewChatScreenState();
}

class _AddNewChatScreenState extends State<AddNewChatScreen> {
  List<File> _pickedImages = [];
  List<ChatBubble> _chatBubbles = [];
  final AIImageService _aiImageService = AIImageService();

 void _sendImage(File image) async {
  setState(() {
    _chatBubbles.add(ChatBubble(
      image: image,
      status: "جاري تحليل الصورة...",
      isMe: true,
      isError: false,
    ));
  });

  // جدول تحويل من فرانكو إلى عربي
  const Map<String, String> labelMap = {
    "aleff": "ا", "bb": "ب", "ta": "ت", "thaa": "ث",
    "jeem": "ج", "ha": "ح", "khaa": "خ", "dal": "د",
    "thal": "ذ", "ra": "ر", "zay": "ز", "seen": "س",
    "sheen": "ش", "saad": "ص", "dhad": "ض", "taa": "ط",
    "zaa": "ظ", "ain": "ع", "ghain": "غ", "fa": "ف",
    "gaaf": "ق", "kaaf": "ك", "laam": "ل", "meem": "م",
    "nun": "ن", "waw": "و", "yaa": "ي","la":"لا"
  };

  try {
    final response = await _aiImageService.uploadImage(image);
    
    print('======= بداية الرد من الخادم =======');
    print('نوع البيانات: ${response.runtimeType}');
    print('المحتوى الكامل: $response');
    print('======= نهاية الرد من الخادم =======');

    String resultText = "لم يتم اكتشاف أي حروف";
    List<String> detectedLetters = [];

    if (response is Map<String, dynamic>) {
      // الحالة 1: إذا كان الرد يحتوي على detections
      if (response.containsKey('detections') && response['detections'] is List) {
        final detections = response['detections'] as List;
        detectedLetters = detections
            .where((item) => item is Map && item['name'] != null)
            .map((item) => item['name'] as String)
            .toList();
      }
      // الحالة 2: إذا كان الرد يحتوي على letters مباشرة
      else if (response.containsKey('letters') && response['letters'] is List) {
        detectedLetters = List<String>.from(response['letters']);
      }
      // الحالة 3: إذا كان الرد يحتوي على word كمصفوفة نصية
      else if (response.containsKey('word') && response['word'] is String) {
        detectedLetters = (response['word'] as String).split(',');
      }

      // تطبيق الترجمة إذا وجدنا حروفاً
      if (detectedLetters.isNotEmpty) {
        final arabicLetters = detectedLetters
            .map((franco) => labelMap[franco.trim().toLowerCase()] ?? franco)
            .where((letter) => letter.isNotEmpty)
            .toList();

        if (arabicLetters.isNotEmpty) {
          resultText = "الكلمة: ${arabicLetters.join('')}";
        }
      }
    }

    setState(() {
      _chatBubbles.add(ChatBubble(
        status: resultText,
        isMe: false,
        isError: false,
      ));
    });

  } catch (e) {
    print('حدث خطأ: $e');
    setState(() {
      _chatBubbles.add(ChatBubble(
        status: "حدث خطأ في التحليل: ${e.toString()}",
        isMe: false,
        isError: true,
      ));
    });
  }
}

  void _showDetectedObjectInChat(String object) {
    setState(() {
      _chatBubbles.add(ChatBubble(
          status: "تم اكتشاف: $object",
          isMe: false,
          isError: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('محادثة الصور'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.save, size: 24),
              onPressed: _pickedImages.isEmpty
                  ? null
                  : () {
                      final newChat = ChatModel(
                        "محادثة جديدة",
                        "تحتوي على ${_pickedImages.length} صورة",
                        imagePaths: _pickedImages.map((e) => e.path).toList(),
                      );
                      Navigator.pop(context, newChat);
                    },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _chatBubbles.length,
              itemBuilder: (context, index) {
                final bubble = _chatBubbles[index];
                return ChatBubbleWidget(chatBubble: bubble);
              },
            ),
          ),
          if (_pickedImages.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'اضغط على أيقونة الكاميرا لإضافة صورة',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.camera, size: 20),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BottomSheetCamera(
              onImagePicked: (File? image) {
                if (image != null) {
                  setState(() {
                    _pickedImages.add(image);
                  });
                  _sendImage(image);
                }
              },
            ),
          );
        },
      ),
    );
  }
}









































































































































// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:g2/models/chat_bubble_model.dart';
// import 'package:g2/models/chat_model.dart';
// import 'package:g2/widgets/bottom_sheet_camera.dart';
// import 'package:g2/widgets/chat_bubble_widget.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class AddNewChatScreen extends StatefulWidget {
//   const AddNewChatScreen({super.key});

//   @override
//   State<AddNewChatScreen> createState() => _AddNewChatScreenState();
// }

// class _AddNewChatScreenState extends State<AddNewChatScreen> {
//   List<File> _pickedImages = [];
//   List<ChatBubble> _chatBubbles = [];
//   late IO.Socket socket;

//   @override
//   void initState() {
//     super.initState();
//     _initSocket();
//   }

//   void _initSocket() {
//     // تأكد من تغيير العنوان ليتوافق مع سيرفرك
//     socket = IO.io('http://your-server-address.com', <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': true,
//     });

//     socket.onConnect((_) {
//       print('Connected to Socket.IO server');
//     });

//     socket.onDisconnect((_) {
//       print('Disconnected from Socket.IO server');
//     });

//     socket.onError((error) {
//       print('Socket error: $error');
//     });

//     // استقبال رسائل من السيرفر
//     socket.on('message', (data) {
//       _addMessage(data['text'], false, image: data['image']);
//     });

//     socket.on('image_response', (data) {
//       _addMessage(data['status'], false, imageUrl: data['imageUrl']);
//     });
//   }

//   void _addMessage(String status, bool isMe, {File? image, String? imageUrl}) {
//     setState(() {
//       _chatBubbles.add(ChatBubble(
//         status: status,
//         isMe: isMe,
//         image: image,
//         imageUrl: imageUrl,
//       ));
//     });
//   }

//   @override
//   void dispose() {
//     socket.disconnect();
//     super.dispose();
//   }

//   void _sendImage(File image) async {
//     // إضافة رسالة "جاري التحليل" إلى الدردشة
//     _addMessage("جاري التحليل...", true, image: image);

//     try {
//       // تحويل الصورة إلى base64 لإرسالها عبر السوكيت
//       final bytes = await image.readAsBytes();
//       final base64Image = base64Encode(bytes);

//       // إرسال الصورة إلى السيرفر
//       socket.emit('image_upload', {
//         'image': base64Image,
//         'fileName': 'image_${DateTime.now().millisecondsSinceEpoch}.jpg',
//       });
//     } catch (e) {
//       _addMessage("فشل في إرسال الصورة", true);
//       print('Error sending image: $e');
//     }
//   }

//   void _sendTextMessage(String text) {
//     _addMessage(text, true);
//     socket.emit('message', {'text': text});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('محادثة الصور'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: IconButton(
//               icon: const Icon(Icons.save, size: 24),
//               onPressed: _pickedImages.isEmpty
//                   ? null
//                   : () {
//                       final newChat = ChatModel(
//                         "محادثة جديدة",
//                         "تحتوي على ${_pickedImages.length} صورة",
//                         imagePaths: _pickedImages.map((e) => e.path).toList(),
//                       );
//                       Navigator.pop(context, newChat);
//                     },
//               padding: EdgeInsets.zero,
//               constraints: const BoxConstraints(),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: _chatBubbles.length,
//               itemBuilder: (context, index) {
//                 final bubble = _chatBubbles[index];
//                 return ChatBubbleWidget(chatBubble: bubble);
//               },
//             ),
//           ),
//           if (_chatBubbles.isEmpty)
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Center(
//                 child: Text(
//                   'اضغط على أيقونة الكاميرا لإضافة صورة',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           // حقل إرسال الرسائل النصية
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(FontAwesomeIcons.camera, size: 20),
//         onPressed: () {
//           showModalBottomSheet(
//             backgroundColor: Colors.transparent,
//             context: context,
//             builder: (builder) => BottomSheetCamera(
//               onImagePicked: (image) {
//                 if (image != null) {
//                   setState(() {
//                     _pickedImages.add(image);
//                   });
//                   _sendImage(image);
//                 }
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }