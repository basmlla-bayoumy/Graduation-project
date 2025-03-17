
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

 static dynamic getData({
    required String key,
  }) {
   return sharedPreferences!.get(key);
  }


  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  })
   async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);

    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> removeData({
    required String key,
  }) async
  {
   return await sharedPreferences!.remove(key);
  }

  static Future<bool> clearData(
  ) async
  {
   return await sharedPreferences!.clear();
  }

//   static Future<Widget> auth() async {
//   await CacheHelper.init(); // Initialize CacheHelper
//   Widget widget;

//   // Retrieve uId from cache
//   String? uId = CacheHelper.getData(key: 'uId');

//   // Determine which widget to return based on uId
//   if (uId != null) {
//     print('uId : $uId');
//     widget = const Welcomepage(); // Navigate to WelcomePage if uId exists
//   } else {
//     widget = const WelcomePage2(); // Navigate to WelcomePage2 if uId is null
//   }

//   return widget; // Return the determined widget
// }
 
}
