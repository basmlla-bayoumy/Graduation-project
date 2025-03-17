import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:g2/constants.dart';
import 'package:g2/cubit/login_cubit/login_cubit.dart';
import 'package:g2/widgets/custom_buttom.dart';
import 'package:g2/widgets/custom_text_from_field.dart';

// ignore: must_be_immutable
class ResertPassword extends StatelessWidget {
  ResertPassword({super.key});
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Enter your Email to Resret your Password'),
                  const SizedBox(
                    height: 25,
                  ),
                  customTextFromField(
                      icon: const Icon(FontAwesomeIcons.envelope),
                      hintText: 'Enter Email',
                      controller: emailController),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButtom(
                    text: 'Send Email',
                    onTap: ()async {
                    await  LoginCubit.get(context).sendPasswordResetLink(emailController.text);
                    showSnakBar(context,'An Email for reset has been sent to your email');
                    Navigator.pop(context);
                    },
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
