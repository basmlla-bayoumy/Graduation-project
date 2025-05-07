import 'package:flutter/material.dart';
import 'package:g2/models/chat_model.dart';
import 'package:g2/widgets/custom_card_chat.dart';

class ChatsListview extends StatelessWidget {
  ChatsListview({super.key, required this.chats});
  final List<ChatModel> chats;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return CustomCardChat(
          chatModel: chats[index],
          chats: chats,
          index: index,
        );
      },
    );
  }
}
