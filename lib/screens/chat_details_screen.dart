import 'dart:io';
import 'package:flutter/material.dart';
import 'package:g2/models/chat_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  final ChatModel chat;
  final int chatIndex;

  const ChatDetailsScreen({
    Key? key,
    required this.chat,
    required this.chatIndex,
  }) : super(key: key);

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chat.message,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              _formatDate(DateTime.now()), // يمكنك استخدام تاريخ المحادثة الفعلي إذا كان متاحاً
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: chat.imagePaths.length,
        itemBuilder: (context, index) {
          final aiResponse = index < chat.aiResponses.length 
              ? chat.aiResponses[index] 
              : 'لا يوجد تحليل متاح';
              
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(),
                        body: Center(
                          child: InteractiveViewer(
                            panEnabled: true,
                            minScale: 0.5,
                            maxScale: 4.0,
                            child: Image.file(
                              File(chat.imagePaths[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Image.file(
                      File(chat.imagePaths[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  aiResponse,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(thickness: 1),
            ],
          );
        },
      ),
    );
  }
}