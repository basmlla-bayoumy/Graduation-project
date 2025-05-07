import 'package:flutter/material.dart';
import 'package:g2/models/chat_bubble_model.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({super.key, required this.chatBubble});
  final ChatBubble chatBubble;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatBubble.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: chatBubble.isMe ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (chatBubble.image != null)
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(chatBubble.image!, fit: BoxFit.cover),
                ),
              ),
            Text(chatBubble.status),
          ],
        ),
      ),
    );;
  }
}