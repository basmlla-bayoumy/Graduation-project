import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g2/constants.dart';
import 'package:g2/cubit/learn_me_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LearnMeCubit, LearnMeState>(
      listener: (context, state) {
        if (state is LearnMeSignOutSuccess) {
          showSnakBar(context, 'signOut success');
        }
       
      },
      builder: (context, state) {
        var UserModel = LearnMeCubit.get(context).user;
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            clipBehavior: Clip.antiAlias,
            children:[ Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'User Info',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.purple.withOpacity(.9),
                          fontWeight: FontWeight.bold),
                    ),
                    
                  ],
                ),
                custom_column_info(
                  label: 'Name',
                  text: '${UserModel?.name!.toUpperCase()}',
                ),
                const SizedBox(height: 10,),
                custom_column_info(
                  label: 'Phone',
                  text: '${UserModel?.number}',
                ),
                const SizedBox(height: 10,),
                custom_column_info(
                 label: 'Email',
                 text: '${UserModel?.email}',
                ),
                const SizedBox(height: 10,),
                custom_column_info(
                 label: 'Age',
                 text: '${UserModel?.age}',
                ),
                
                const SizedBox(
                  height: 130,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    LearnMeCubit.get(context).signOut();
                  },
                  label: const Text(' SignOut'),
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey, width: .9),
                      elevation: 13,
                      shadowColor: Colors.deepPurple.withOpacity(.9),
                      fixedSize: const Size(400, 90),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      textStyle:
                          const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),]
          ),
        );
      },
    );
  }
}

class custom_column_info extends StatelessWidget {
  const custom_column_info({
    super.key,
    required this.text, required this.label,
  });
  final String text;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: Text(
                label,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.purple.withOpacity(.5), width: 2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(5, 4),
                    blurRadius: 5,
                    spreadRadius: 0),
                const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2, -4),
                    blurRadius: 5,
                    spreadRadius: 0)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Text(
                text,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ],
    );
  }
}





// IconButton(
//                       onPressed: (){
//                       Get.to(()=>EditProfilePage());
//                     },
//                      icon: Icon(FontAwesomeIcons.penToSquare),
                     
//                      ),