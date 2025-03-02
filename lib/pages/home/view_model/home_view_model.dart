import 'package:flutter/cupertino.dart';

class HomeViewModel  extends ChangeNotifier {
  bool isLeftSelected = true;
  String psychologistTime = 'Для себя';
  String forMyself = 'от 2000 ₽ ~ 50 минут';
  void onLeftSelected(bool value) {
    isLeftSelected = value;
    if (isLeftSelected) {
      forMyself = 'Для себя';
      psychologistTime = 'от 2000 ₽ ~ 50 минут';
    }else {
      forMyself = 'Для двоих';
      psychologistTime = 'от 4850 ₽ ~ 1,5 часа';
    }
    notifyListeners();
  }

}