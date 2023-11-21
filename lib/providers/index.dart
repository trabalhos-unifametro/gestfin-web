import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  bool isLoggedIn = false;
  String username = '';

  void setIsLoggedIn(bool value){
    isLoggedIn = value;
    notifyListeners();
  }

  void setUsername(String value){
    username = value;
    notifyListeners();
  }

  void resetValues() {
    isLoggedIn = false;
    username = '';
    notifyListeners();
  }
}