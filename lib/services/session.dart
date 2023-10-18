import 'package:shared_preferences/shared_preferences.dart';

class Session {
  Future<bool> save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    bool isSaved = false;
    prefs.setString('token', token)
    .then((value) => isSaved = value);

    return isSaved;
  }

  Future<bool> destroy() async {
    final prefs = await SharedPreferences.getInstance();
    bool isDestroyed = false;
    prefs.remove('token')
    .then((value) => isDestroyed = value);

    return isDestroyed;
  }

  Future<bool> isLoggedIn(String token) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    return (token != null && token.isNotEmpty);
  }
}