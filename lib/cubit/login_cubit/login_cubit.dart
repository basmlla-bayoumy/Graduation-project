import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  String? email;
  String? password;

  void userLogin({
     String? email,
  String? password,
  })
  {
    emit(LearnMeLoginLoding());

     FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value){
          print(value.user!.email);
          print(value.user!.uid);
          

          emit(LearnMeLoginSuccess(uId:value.user!.uid));
        }).catchError((error){
          emit(LearnMeLoginError(error.toString()));
        });
  }

  Future<void> sendPasswordResetLink(String email)async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(LearnMeResertPasswordSuccess());
    }
    catch(e){
      print(e.toString());
    }
  }
  }



