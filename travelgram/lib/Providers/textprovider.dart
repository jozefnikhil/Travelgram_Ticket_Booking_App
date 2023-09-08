import 'package:flutter/material.dart';

class TextInputProvider extends ChangeNotifier {
  String _frmstn = '';
  String _tostn = '';
  String _date = '';

  String get frminput => _frmstn;
  String get toinput => _tostn;
  String get date => _date;

  void updateTextInput(String newText) {
    _frmstn = newText;

    notifyListeners();
  }

  void updateTextInput2(String newText) {
    _tostn = newText;

    notifyListeners();
  }
   void updateTextInput3(String newText) {
    _date = newText;

    notifyListeners();
  }
}
