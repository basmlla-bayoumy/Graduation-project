import 'package:flutter/material.dart';
import 'package:g2/models/chat_model.dart';
import 'package:g2/screens/chat_details_screen.dart';

class CustomCardChat extends StatelessWidget {
  const CustomCardChat({
    super.key,
    required this.chatModel,
    required this.index,
    required this.chats,
  });
  
  final ChatModel chatModel;
  final int index;
  final List<ChatModel> chats;

  String _getLastResponse() {
    if (chatModel.aiResponses.isEmpty) {
      return 'لا توجد ردود بعد';
    }
    return chatModel.aiResponses.last;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailsScreen(
              chat: chatModel,
              chatIndex: index,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(
              _getLastResponse(), // عرض آخر رد بدلاً من الرسالة الأصلية
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              chatModel.subtitle,
              style: TextStyle(fontSize: 16),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${chatModel.imagePaths.length} صور',
                  style: TextStyle(color: Colors.blue),
                ),
                if (chatModel.aiResponses.isNotEmpty)
                  Icon(Icons.done_all, color: Colors.green, size: 16),
              ],
            ),
          ),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}