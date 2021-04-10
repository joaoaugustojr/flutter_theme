import 'package:flutter/widgets.dart';

// Control globals variables
class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDarkTheme = false;

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
