import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g2/models/user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'sgin_up_state.dart';

class SginUpCubit extends Cubit<SginUpState> {
  SginUpCubit() : super(SginUpInitial());
  static SginUpCubit get(context) => BlocProvider.of(context);

  String? email;
  String? numberPhone;
  String? name;
  String? password;
  String? age;

  void userSginUp({
    required String? name,
    required String? email,
    required String? numberPhone,
    required String? password,
     required String? age,
  }) 
  {
   emit(LearnMeSginUpLoding());

        FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
      )
      // ignore: non_constant_identifier_names
      .then((Value) {
        
         createUser(name: name,
          number: numberPhone,
           email: email,
           age :age,
            uId: Value.user!.uid );
      
    })
    .catchError((error) {
      emit(LearnMeSginUpError(error.toString()));
    });
  }

  
  void createUser({
    required String? name,
    required String? number,
    required String? email,
     required String? age,
    required String? uId,
     
  }) {
    UserModel user = UserModel(
        name: name,
        number: number,
        email: email,
        age: age,
         uId: uId,
         isEmailVerified: false);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(user.toMap())
        .then((value) {

         emit(LearnMeCreateUserSuccess());
        })
        .catchError((error) {
          emit(LearnMeCreateUserError(error.toString()));
        });
  }
  }

