

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/router/router.dart';

class LoginViewModel extends ChangeNotifier {
  bool isPersonalQuestions = false;
  bool isConfirm = false;
  TextEditingController phoneController = TextEditingController();
  String? data;

  onConfirm() {
    isConfirm = !isConfirm;
    notifyListeners();
  }

  void onValidation(BuildContext context){
    context.go(RouteNames.consultation);
  }

  Future<String> loadFromJson() async {
    return await rootBundle.loadString('assets/countries/country_list_en.json');
  }
}