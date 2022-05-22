import 'package:shared_preferences/shared_preferences.dart';

class CatchHelper
{
  static late SharedPreferences sharedPreferences;
static init()async
{
  sharedPreferences = await SharedPreferences.getInstance();
}
static Future<bool> saveDAta(
  {
    required String key,
    required String value,
}
    )async
{
 return  await sharedPreferences.setString(key, value);
}
  static dynamic gateData({
    required String key,
  })
  {
    return sharedPreferences.getString(key);
  }
  static dynamic removeData({
    required String key,
  })
  {
    return sharedPreferences.remove(key);
  }
}