
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g2/cache_helper.dart';
import 'package:g2/constants.dart';
import 'package:g2/cubit/learn_me_cubit.dart';
import 'package:g2/firebase_options.dart';
import 'package:g2/models/chat_model.dart';
import 'package:g2/screens/welcome_page2.dart';
import 'package:g2/screens/welcomepage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await Hive.initFlutter();

  // تسجيل الـ Adapter
  Hive.registerAdapter(ChatModelAdapter());

// بتحذف الشاتات القديمة 
  // await Hive.deleteBoxFromDisk('chats');

  // افتح الصندوق
  await Hive.openBox<ChatModel>('chats');
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  Widget widget;

  uId = CacheHelper.getData(key: 'uId');
  if (uId != null) {
     print('uId : $uId');

    widget = const Welcomepage();
  } else {
    widget = const WelcomePage2();
  }
  runApp(LearnMe(
    startWidget: widget,
  ));

}

class LearnMe extends StatelessWidget {
  const LearnMe({super.key, required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => LearnMeCubit()..getUserData()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}


