import 'package:flutter/material.dart';
import 'package:g2/models/chat_model.dart';
import 'package:g2/screens/chat_details_screen.dart';
import 'package:get/get.dart';

class CustomCardChat extends StatelessWidget {
  const CustomCardChat({super.key, required this.chatModel, required this.chats, required this.index});
  final ChatModel chatModel;
  final List<ChatModel> chats ;
  final int index ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailsScreen(chatModel: chatModel, chat: chatModel,),
            ),);

      },
      child: Column(
        children: [
          ListTile(
            title: Text(chatModel.message,style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold
            ),),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width:3,),
                Text(chatModel.message,style: TextStyle(
              fontSize: 18,)),
              ],
            ),
            trailing: Text(chatModel.message),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 20),
            child: Divider(thickness: 1,),
          )
        ],
      ),
    );
  }
}