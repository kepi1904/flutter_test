import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static Future<void> storingToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
  }

  static Future<String?> retrieveToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? result = preferences.getString("token");
    return result;
  }

  static Future<void> removeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("token");
  }
}
