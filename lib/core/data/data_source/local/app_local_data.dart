
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../pages/login/model/user_model.dart';

class AppLocalData {

  static Future<void> saveGridAxisCount(int gridCount) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('axisCount', gridCount);
  }
  static Future<int> getGridAxisCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('axisCount') ?? 1;
  }


  static Future<void> saveStylistDesignSwitch(int filterIndex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('stylistDesignSwitch', filterIndex);
  }
  static Future<int> getStylistDesignSwitch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('stylistDesignSwitch') ?? 0;
  }


  static Box<dynamic> box = Hive.box('appBox');

  static Future<void> saveUserToken(String? token) async {
    await box.put('token', token);
  }

  static Future<String?> get getUserToken async {
    return await box.get('token');
  }

  static Future<void> saveUserRefreshToken(String? refreshToken) async {
    await box.put('refreshToken', refreshToken);
  }

  static Future<String?> get getUserRefreshToken async {
    return await box.get('refreshToken');
  }

  static Future<void> saveUserModel(UserModel userModel) async {
    await box.put('userModel', userModel.toJsonSaveHive());
  }

  static Future<Map> get getUserModel async {
    return await box.get('userModel');
  }

  static Future<void> removeAll() async {
    await box.deleteAll([
      'token',
      'refreshToken',
      'userModel',
    ]);
  }

}
