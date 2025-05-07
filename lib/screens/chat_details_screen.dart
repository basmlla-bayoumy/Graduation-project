import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:g2/models/chat_model.dart';
import 'package:g2/widgets/bottom_sheet_camera.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key, required this.chatModel} );
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(chatModel.message,style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Text('hi there'),
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(FontAwesomeIcons.camera),
      //     onPressed: (){
      //       showModalBottomSheet(
      //         backgroundColor: Colors.transparent,
      //         context: context,
      //          builder:(builder)=> BottomSheetCamera());
      //     }),
    );
  }
}