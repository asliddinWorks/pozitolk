import 'package:flutter/cupertino.dart';

class HomeViewModel  extends ChangeNotifier {
  bool isLeftSelected = true;

  void onLeftSelected(bool value) {
    isLeftSelected = value;
    notifyListeners();
  }

}