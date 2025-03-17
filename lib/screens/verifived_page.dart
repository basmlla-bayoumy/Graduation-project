import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g2/constants.dart';
import 'package:g2/cubit/learn_me_cubit.dart';

class VerifivedPage extends StatelessWidget {
  const VerifivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LearnMeCubit, LearnMeState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Learn',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Me',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          body: ConditionalBuilder(
            condition: LearnMeCubit.get(context).user != null,
            builder: (context) {

              return Column(
                children: [
                  if (FirebaseAuth.instance.currentUser!.emailVerified)
                    Container(
                      color: Colors.amberAccent.withOpacity(.6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            const Icon(Icons.info_outline),
                            const Text(
                              'Please verify your Email',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                FirebaseAuth.instance.currentUser?.sendEmailVerification()
                                .then((value){
                                  // ignore: use_build_context_synchronously
                                  showSnakBar(context,'Check your mail',);
                                })
                                .catchError((error){
                                  
                                });
                              },
                              child: Container(
                                  height: 50,
                                  width: 100,
                                  margin: const EdgeInsets.only(left: 50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    ' SEND ',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
            fallback: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}
