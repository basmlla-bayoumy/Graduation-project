import 'dart:io';
import 'package:dio/dio.dart';

class AIImageService {
  final Dio _dio = Dio();
  final String baseUrl = "https://e630-2c0f-fc89-80b3-66d7-251d-e948-34bf-c63.ngrok-free.app";

  Future<Map<String, dynamic>> uploadImage(File imageFile) async {
    try {
      print("Uploading image: ${imageFile.path}");

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      });

      Response response = await _dio.post(
        '$baseUrl/ai/image-process',
        data: formData,
      );

      print("Server response: ${response.data}");
      return response.data;
    } catch (e) {
      print("Error uploading image: $e");
      throw Exception('Failed to upload image: $e');
    }
  }
}