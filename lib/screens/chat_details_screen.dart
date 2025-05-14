import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:g2/models/chat_model.dart';
import 'package:g2/widgets/bottom_sheet_camera.dart';

class ChatDetailsScreen extends StatelessWidget {
  final ChatModel chat;

  const ChatDetailsScreen({Key? key, required this.chat, required ChatModel chatModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image Container
            if (chat.imagePath != null || (chat.imagePaths != null && chat.imagePaths!.isNotEmpty))
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: chat.imagePath != null 
                  ? Image.network(chat.imagePath!, fit: BoxFit.cover)
                  : Image.network(chat.imagePaths!.first, fit: BoxFit.cover),
              ),
            
            SizedBox(height: 20),
            
            // Text Container
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[50],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.message,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    chat.subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}