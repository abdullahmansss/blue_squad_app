import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static late SharedPreferences sharedPreferences;

  static Future<SharedPreferences> init() async
  {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
  required dynamic key,
  required dynamic value,
})
  {
    if(value is bool)
      return sharedPreferences.setBool(key, value);
    if(value is double)
      return sharedPreferences.setDouble(key, value);
    if(value is int)
      return sharedPreferences.setInt(key, value);

    return sharedPreferences.setString(key, value);
  }

  static dynamic getData({
    required dynamic key,
  })
  {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({
    required dynamic key,
  })
  {
    return sharedPreferences.remove(key);
  }
}