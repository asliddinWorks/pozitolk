import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/pages/login/model/user_model.dart';
import 'package:pozitolk/router/router.dart';

import '../data/login_repo/login_repo.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this.registerRepo);
  final RegisterRepo registerRepo;

  final formKey = GlobalKey<FormState>();
  bool isPersonalQuestions = false;
  bool isConfirm = false;
  String selectedCountryCode = 'RU';
  TextEditingController phoneController = TextEditingController();
  String phoneNumber = '';
  String? data;
  String? confirmNumber;
  String? confirmCode;
  bool isLoading = false;
  int count = 45;
  bool finishCount = false;
  bool isConfirmError = false;

  onConfirm() {
    isConfirm = false;
    notifyListeners();
  }

  Future<String> loadFromJson() async {
    return await rootBundle.loadString('assets/countries/country_list_en.json');
  }

  Future<void> register(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (phoneNumber.isNotEmpty) {
      UserModel userModel = UserModel(phone: phoneNumber);
      confirmNumber = await registerRepo.register(context, userModel);
      if (confirmNumber != null) {
        isConfirm = true;
        countdown(45);
        finishCount = false;
        notifyListeners();
        print('okkkk $confirmNumber');
      }
    }
    isLoading = false;
  }

  Future<void> countdown(int seconds) async {
    for (int i = seconds; i >= 0; i--) {
      count = i;
      notifyListeners();
      await Future.delayed(Duration(seconds: 1));
    }
    finishCount = true;
    notifyListeners();
  }

  Future<void> confirm(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    print('yyyy  $confirmNumber njfjfjfj $confirmCode');
    if(confirmNumber == confirmCode){
      UserModel userModel = UserModel(
        phone: phoneNumber,
        code: confirmCode,
        isPsychologist: true,
      );
      if (await registerRepo.confirm(context, userModel) == true ) {
        isConfirm = false;
        notifyListeners();
        context.go(RouteNames.consultation);
      }
    }else{
      isConfirmError = true;
      notifyListeners();
    }
    // if (phoneNumber.isNotEmpty && confirmNumber != null) {
    //   UserModel userModel = UserModel(
    //     phone: phoneNumber,
    //     code: confirmCode,
    //     isPsychologist: true,
    //   );
    // }
    isLoading = false;
  }
}
