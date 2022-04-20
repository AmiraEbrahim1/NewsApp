import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper {

  static late SharedPreferences _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();//??
  }

  //get data from any function
  static dynamic getData({required String key}) {
    return _preferences.get(key);
  }

  // save data from any function
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async
  {
    // save string data
    if (value is String) return await _preferences.setString(key, value);
    // save integer data
    if (value is int) return await _preferences.setInt(key, value);
    //save bool data
    if (value is bool) return await _preferences.setBool(key, value);
    //بتحفظ اي داتا غير اللي فوق
    return await _preferences.setDouble(key, value);
  }

//remove data
  static Future<bool> removeData({
    required String key,
  }) async {
    return await _preferences.remove(key);
  }
}