import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<bool> save(String token, String username) async {
    final prefs = await SharedPreferences.getInstance();
    bool isSavedToken = false;
    bool isSavedUsername = false;
    isSavedToken = await prefs.setString('token', token);
    isSavedUsername = await prefs.setString('username', username);

    return isSavedToken && isSavedUsername;
  }

  static Future<bool> destroy() async {
    final prefs = await SharedPreferences.getInstance();
    bool isDestroyed = false;
    isDestroyed = await prefs.remove('token');
    await prefs.remove('username');

    return isDestroyed;
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    return (token != null && token.isNotEmpty);
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');

    return username;
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    return token ?? '';
  }
}