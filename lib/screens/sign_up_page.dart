import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:g2/cubit/sgin_up_cubit/sgin_up_cubit.dart';
import 'package:g2/models/user_model.dart';
import 'package:g2/screens/firstpage.dart';
import 'package:g2/widgets/custom_buttom.dart';
import 'package:g2/widgets/custom_text_from_field.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  UserModel userModel = UserModel();
  GlobalKey<FormState> formkey = GlobalKey();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
   var ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SginUpCubit(),
      child: BlocConsumer<SginUpCubit, SginUpState>(
        listener: (context, state) {
          if (state is LearnMeCreateUserSuccess) {
            
            Get.to(()=> const Firstpage());
             }
          
          else if (state is LearnMeSginUpError) {
            showSnakBar(context, state.error);
          } 
          
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color(0xff710193),
                Color(0xff9867c5),
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign UP',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: formkey,
                          child: ListView(
                            children: [
                              Column(children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(147, 112, 219, .5),
                                          blurRadius: 20,
                                          offset: Offset(0, 10),
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      customTextFromField(
                                        icon: const Icon(Icons.person),
                                        hintText: ' Name',
                                        onChanged: (data) {
                                          SginUpCubit.get(context).name = data;
                                        },
                                        controller: nameController,
                                      ),
                                      customTextFromField(
                                        icon: const Icon(Icons.phone),
                                        hintText: 'Number Phone',
                                        onChanged: (data) {
                                          SginUpCubit.get(context).numberPhone =
                                              data.toString();
                                        },
                                        controller: phoneController,
                                      ),
                                      customTextFromField(
                                        icon: const Icon(Icons.email),
                                        hintText: 'Email ',
                                        onChanged: (data) {
                                          SginUpCubit.get(context).email = data;
                                        },
                                        controller: emailController,
                                      ),
                                      customTextFromField(
                                        icon: const Icon(Icons.password),
                                        hintText: 'Password',
                                        onChanged: (data) {
                                          SginUpCubit.get(context).password =
                                              data;
                                        },
                                        obscureText: true,
                                        controller: passwordController,
                                      ),
                                      customTextFromField(
                                        icon: const Icon(FontAwesomeIcons.calendarDay),
                                        hintText: ' Age',
                                        onChanged: (data) {
                                          SginUpCubit.get(context).age = data;
                                        },
                                        controller: ageController,
                                      ),

                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                               ConditionalBuilder(
                                    condition: state is! LearnMeSginUpLoding,
                                    builder: (context) => CustomButtom(
                                  onTap: () {
                                    if (formkey.currentState!.validate()) {}

                                    SginUpCubit.get(context).userSginUp(
                                        name: nameController.text,
                                        numberPhone: phoneController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        age: ageController.text);
                                  }, text: 'Sgin up',
                                ),
                                 fallback: (context) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                ),

                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'alredy have an account ?',
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 18),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        ' Login',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey.shade700),
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showSnakBar(BuildContext context, String messsage) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messsage)));
  }
}
