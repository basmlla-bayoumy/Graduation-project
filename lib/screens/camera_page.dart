import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:g2/models/chat_model.dart';
import 'package:g2/screens/AddNewCahtsScreen.dart';
import 'package:g2/screens/chat_details_screen.dart';
import 'package:g2/widgets/custom_card_chat.dart';
import 'package:hive/hive.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late Box<ChatModel> chatBox;

  @override
  void initState() {
    super.initState();
    chatBox = Hive.box<ChatModel>('chats');
  }

  void _addNewChat(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddNewChatScreen()),
  );

  if (result != null && result is ChatModel) {
    await chatBox.add(result); // هذه الطريقة تضيف جديد دون مسح القديم
    setState(() {});
  }
}

  void _openChatDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailsScreen(
          chat: chatBox.getAt(index)!,
          chatIndex: index,
        ),
      ),
    );
  }

  @override
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('المحادثات المحفوظة'),
    ),
    body: chatBox.isEmpty
        ? Center(child: Text('لا توجد محادثات'))
        : ListView.builder(
            itemCount: chatBox.length,
            itemBuilder: (context, index) {
              final chat = chatBox.getAt(index)!;
              return CustomCardChat(
                chatModel: chat,
                index: index, chats: [],
              );
            },
          ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _addNewChat(context),
    ),
  );
}

}



















// Widget bottomSheet(){
// return Container(
//   height: 200,
//   width: double.infinity,
//   child: Card(
//     margin: EdgeInsets.all(18),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
//       child: Row(
//         children: [
//           Column(
//             children: [
//               FloatingActionButton(
//                 onPressed: (){
//                   (ImageSource.camera);
//                 },
//                 child: Icon(FontAwesomeIcons.camera),),
//               Text('camera'),
//             ],
//           ),
//           SizedBox(width: 35,),
//           Column(
//             children: [
//               FloatingActionButton(
//                 onPressed:(){},
//                 child: Icon(FontAwesomeIcons.file),),
//                 Text('Files')
//             ],
//           )
//         ],
//       ),
//     ),
//   ),
// );
// }





// Container(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//            if(image != null)
//                  Image.file(
//                     image!,
//                     height: 550,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   )
//                 ,
//             const SizedBox(
//               height: 35,
//             ),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   pickImage(ImageSource.camera);
//                 },
//                 style: ButtonStyle(
//                   shape: WidgetStatePropertyAll(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8))),
//                 ),
//                 child: const Icon(FontAwesomeIcons.camera),
//               ),
//             ),
//           ],
//         ),
//       )






