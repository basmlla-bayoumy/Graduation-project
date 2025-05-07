
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g2/cache_helper.dart';
import 'package:g2/constants.dart';
import 'package:g2/models/user_model.dart';
import 'package:g2/screens/TheFirst_page.dart';
import 'package:g2/screens/camera_page.dart';
import 'package:g2/screens/loginpage.dart';
import 'package:g2/screens/settings_page.dart';
import 'package:get/get.dart';

part 'learn_me_state.dart';

class LearnMeCubit extends Cubit<LearnMeState> {
 LearnMeCubit() : super(LearnMeInitial());

static LearnMeCubit get(context) => BlocProvider.of(context);
 
   UserModel ? user;
   
   getUserData() async
 {
  emit(LearnMeGetUserLoading());

  await FirebaseFirestore.instance.collection('users')
  .doc(uId)
  .get().
  then((value){
    print( value.data());
  user= UserModel.fromJson(value.data());
   emit(LearnMeGetUserSuccess());
  }).
  catchError((error){
    print(error.toString());

    emit(LearnMeGetUserError(error.toString()));
    
  });
 }

int currentIndex = 0;

List<Widget> screens =  [
  const ThefirstPage(),
  const CameraPage(),
  const SettingsPage()
] ;

List<String> Titles =  [
  'Home',
  'Chats',
  'Settings'
] ;
 
 void changeBottomNav(int index){
  currentIndex =index;
  emit(LearnMeChangeBottomNav());
 }

  void signOut(){
     FirebaseAuth.instance.signOut();
      CacheHelper.clearData();
      Get.offAll(()=> Loginpage());
        
  }

}

