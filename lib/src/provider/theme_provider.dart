import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{

  ThemeData _theme = ThemeData.light();
  ThemeData get theme => _theme;
  void change(ThemeData theme){
    this._theme = theme;
    notifyListeners();
  }
}
