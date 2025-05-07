import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:g2/models/chat_bubble_model.dart';
import 'package:g2/models/chat_model.dart';
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
  

  @override
  void dispose() {
    super.dispose();
  }

  void _sendImage(File image) async {
    setState(() {
      _chatBubbles.add(ChatBubble(
        image: image,
        status: "جاري التحليل...",
        isMe: true,
      ));
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _chatBubbles.add(ChatBubble(
        status: "تم تحليل الصورة بنجاح",
        isMe: false,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('محادثة الصور'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0), // تضييق المساحة حول الزر
            child: IconButton(
              icon: const Icon(Icons.save, size: 24), // تصغير حجم الأيقونة
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
              padding: EdgeInsets.zero, // إزالة الحشو الداخلي
              constraints: const BoxConstraints(), // إزالة القيود على حجم الزر
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
            backgroundColor: Colors.transparent,
            context: context,
            builder: (builder) => BottomSheetCamera(
              onImagePicked: (image) {
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

