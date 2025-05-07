import 'dart:io';

class ChatBubble {
  final File? image;
  final String status;
  final bool isMe;

  ChatBubble({
    this.image,
    required this.status,
    required this.isMe,
  });
}