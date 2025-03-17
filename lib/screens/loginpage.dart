import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g2/cache_helper.dart';
import 'package:g2/constants.dart';
import 'package:g2/cubit/login_cubit/login_cubit.dart';
import 'package:g2/screens/firstpage.dart';
import 'package:g2/screens/resert_password.dart';
import 'package:g2/screens/sign_up_page.dart';
import 'package:g2/widgets/custom_text_from_field.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  GlobalKey<FormState> formkey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LearnMeLoginSuccess) {
            showSnakBar(context, 'login suceess');

            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
            ).then((Value) {
              Get.to(() => const Firstpage());
            });
          } else if (state is LearnMeLoginError) {
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
                          'Login',
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
                        padding: const EdgeInsets.all(10),
                        child: Form(
                          key: formkey,
                          child: ListView(
                            children: [
                              Column(children: [
                                const SizedBox(
                                  height: 60,
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
                                          icon: const Icon(Icons.email),
                                          hintText: 'Email or Number phone',
                                          onChanged: (data) {
                                            LoginCubit.get(context).email =
                                                data;
                                          },
                                          controller: emailController),
                                      customTextFromField(
                                        icon: const Icon(Icons.password),
                                        obscureText: true,
                                        hintText: 'Password',
                                        onChanged: (data) {
                                          LoginCubit.get(context).password =
                                              data;
                                        },
                                        controller: passwordController,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(ResertPassword());
                                      },
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade700),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ConditionalBuilder(
                                          condition:
                                              state is! LearnMeLoginLoding,
                                          builder: (context) => Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: const Color(
                                                              0xff4F1787)
                                                          .withOpacity(.8)),
                                                  child: Center(
                                                    child: GestureDetector(
                                                      child: const Text(
                                                        'Login',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      onTap: () {
                                                        if (formkey
                                                            .currentState!
                                                            .validate()) {
                                                          LoginCubit.get(
                                                                  context)
                                                              .userLogin(
                                                                  email:
                                                                      emailController
                                                                          .text,
                                                                  password:
                                                                      passwordController
                                                                          .text);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          fallback: (context) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }),
                                    ),
                                    // Expanded(
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(3.0),
                                    //     child: Container(
                                    //       height: 50,
                                    //       decoration: BoxDecoration(
                                    //           borderRadius:
                                    //               BorderRadius.circular(30),
                                    //           color: const Color(0xff7E5CAD)),
                                    //       child: const Center(
                                    //         child: Text(
                                    //           'Gmail',
                                    //           style: TextStyle(
                                    //               color: Colors.white,
                                    //               fontSize: 20,
                                    //               fontWeight: FontWeight.bold),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'don\'t have any account ?',
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 18),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SignUpPage();
                                        }));
                                      },
                                      child: Text(
                                        ' Sign Up',
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
}
































//  Text(
                          //   'Continue with social media',
                          //   style: TextStyle(fontSize: 16, color: Colors.grey),
                          // ),
                          // SizedBox(
                          //   height: 40,
                          // ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         height: 50,
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(50),
                          //             color: Color(0xff9e7bb5)),
                          //           child: Center(
                          //     child: Text(
                          //       'Facebook',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 30,
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         height: 50,
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(50),
                          //             color: Color(0xffb65fcf)),
                          //           child: Center(
                          //     child: Text(
                          //       'Gmail',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          //       ),
                          //     ),
                          //   ],
                          // )
