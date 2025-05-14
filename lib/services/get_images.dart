import 'dart:convert';
import 'dart:io';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:dio/dio.dart';
import 'package:g2/models/details_model.dart';
import 'package:g2/models/homepage2_model.dart';
import 'package:g2/models/words_model.dart';


class Getimages {
  final Dio dio;
  Getimages(this.dio);

  Future<List<DetailsModel>> getImages() async {
    try {
      var response = await dio.get(
          'https://8a07-41-232-169-128.ngrok-free.app/api/images?page=1&limit=28',
          options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) => true,
          ));
      print(' this is my response $response.data');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> letters = jsonData['letters'];

      List<DetailsModel> detailsList = [];

      for (var letter in letters) {
        DetailsModel detailsModel = DetailsModel.fromJson(letter);

        detailsList.add(detailsModel);
      }
      return detailsList;
    } catch (e) {
      print('this is error$e');
      return [];
    }
  }

  Future<List<Homepage2Model>> getOutImages() async {
    try {
      var response = await dio.get(
          'https://8a07-41-232-169-128.ngrok-free.app/api/letters?page=1&limit=28',
          options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) => true,
          ));
      print(' this is my response $response.data');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> letters = jsonData['letters'];

      List<Homepage2Model> homepage2List = [];

      for (var letter in letters) {
        Homepage2Model homepage2model = Homepage2Model.fromJson(letter);

        homepage2List.add(homepage2model);
      }
      return homepage2List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<WordsModel>> getWords() async {
    try {
      var response = await dio.get(
          'https://3cb6-41-232-169-128.ngrok-free.app/api/words?page=1&limit=28',
          options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) => true,
          ));
      print(' this is my response $response.data');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> words = jsonData['words'];

      List<WordsModel> wordsList = [];

      for (var word in words) {
        WordsModel wordsModel = WordsModel.fromJson(word);

        wordsList.add(wordsModel);
      }
      return wordsList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}




// class SocketService {
//   final Function(String) onAnalysisComplete;
//   final Function(String) onError;
//   IO.Socket? socket;
//   bool _isConnected = false;

//   SocketService({required this.onAnalysisComplete, required this.onError});

//   Future<void> initSocket() async {
//     try {
//       // إغلاق أي اتصال موجود
//       if (socket != null) {
//         socket!.disconnect();
//         socket!.destroy();
//       }

//       print('جاري تهيئة اتصال جديد بالخادم');
      
//       socket = IO.io('https://qodcfmrvym8b.share.zrok.io/', <String, dynamic>{
//         'transports': ['websocket'],
//         'autoConnect': false,
//         'reconnection': true,
//         'reconnectionAttempts': 5,
//         'reconnectionDelay': 1000,
//       });

//       _setupEventListeners();
      
//       socket!.connect();
//     } catch (e) {
//       onError('فشل تهيئة الاتصال: ${e.toString()}');
//     }
//   }

//   void _setupEventListeners() {
//     socket!.on('connect', (_) {
//       _isConnected = true;
//       print('اتصال ناجح بالخادم');
//       onAnalysisComplete('متصل بالخادم');
//     });

//     socket!.on('disconnect', (_) {
//       _isConnected = false;
//       print('انقطع الاتصال بالخادم');
//       onError('انقطع الاتصال. جاري إعادة المحاولة...');
//     });

//     socket!.on('connect_error', (err) {
//       _isConnected = false;
//       print('خطأ في الاتصال: $err');
//       onError('خطأ اتصال: ${err.toString()}');
//     });

//     socket!.on('error', (err) {
//       _isConnected = false;
//       print('خطأ عام: $err');
//       onError('خطأ: ${err.toString()}');
//     });

//     socket!.on('analysis_result', (data) {
//       if (data is String) {
//         onAnalysisComplete(data);
//       }
//     });
//   }

//   Future<void> sendImageForAnalysis(File image) async {
//     if (!_isConnected) {
//       onError('غير متصل بالخادم. جاري إعادة الاتصال...');
//       await initSocket();
//       if (!_isConnected) {
//         onError('فشل إعادة الاتصال بالخادم');
//         return;
//       }
//     }

//     try {
//       final bytes = await image.readAsBytes();
//       final base64Image = base64Encode(bytes);
      
//       socket!.emit('handGusture', {
//         'image': base64Image,
//         'mimeType': image.path.split('.').last,
//         'timestamp': DateTime.now().toIso8601String(),
//       });
      
//     } catch (e) {
//       onError('فشل إرسال الصورة: ${e.toString()}');
//     }
//   }

//   void disconnect() {
//     _isConnected = false;
//     socket?.disconnect();
//     socket?.destroy();
//   }
// }




















































// socket_service.dart

// class SocketService {
//   late IO.Socket socket;
//   final Function(String) onAnalysisComplete;
//   final Function(String) onError;

//   SocketService({
//     required this.onAnalysisComplete,
//     required this.onError,
//   }) {
//     _initSocket();
//   }

//   void _initSocket() {
//     // Configure socket connection
//     socket = IO.io('http://your-server-address.com', <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': false,
//     });

//     // Setup event listeners
//     socket.onConnect((_) {
//       print('Socket connected');
//     });

//     socket.onDisconnect((_) {
//       print('Socket disconnected');
//     });

//     socket.onError((error) {
//       print('Socket error: $error');
//       onError('حدث خطأ في الاتصال بالخادم');
//     });

//     socket.on('analysis_complete', (data) {
//       print('Analysis complete: $data');
//       onAnalysisComplete(data['message'] ?? 'تم تحليل الصورة بنجاح');
//     });

//     // Connect to the server
//     socket.connect();
//   }

//   void sendImageForAnalysis(File image) async {
//     try {
//       // Convert image to base64 or send as binary data
//       final bytes = await image.readAsBytes();
//       final base64Image = base64Encode(bytes);

//       // Emit the image to the server
//       socket.emit('analyze_image', {
//         'image': base64Image,
//         'timestamp': DateTime.now().toIso8601String(),
//       });
//     } catch (e) {
//       print('Error sending image: $e');
//       onError('حدث خطأ أثناء إرسال الصورة');
//     }
//   }

//   void disconnect() {
//     socket.disconnect();
//     socket.clearListeners();
//   }
// }
