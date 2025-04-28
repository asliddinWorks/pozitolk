import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pozitolk/pages/login/model/user_model.dart';
import '../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../core/tools/toast_bar.dart';
import '../../../../di_service.dart';

abstract class RegisterRepo {
  Future<String?> register(BuildContext context, UserModel userModel);
  Future<bool> confirm(BuildContext context, UserModel userModel);
}

class RegisterRepoImpl extends RegisterRepo {
  RegisterRepoImpl(this.dio);
  final Dio dio;

  @override
  Future<String?> register(BuildContext context, UserModel userModel) async {
    try {
      Response response = await dio.post(
        'cabinet/send-code/',
        options: Options(
          headers: header,
        ),
        data: userModel.toJsonRegister,
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        String? message = response.data['message'];
        return message;
      }
      return '';
    } on DioException catch (e) {
      if (e.response!.data['message'] != null) {
        if ('${e.response!.data['message']}'.contains('Неверный формат')) {
          showToast(context, 'Неверный формат.');
        }
        return '';
      }
    }
    return null;
  }

  @override
  Future<bool> confirm(BuildContext context, UserModel userModel) async {
    try {
      Response response = await dio.post(
        'cabinet/verify-code/',
        options: Options(
          headers: header,
        ),
        data: userModel.toJsonConfirm,
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        AppLocalData.saveUserToken(response.data['token']);
        UserModel userModel = UserModel.fromJsonSaveHive(response.data['user']);
        AppLocalData.saveUserModel(userModel);
        // AppLocalData.saveUserRefreshToken(response.data['refresh']);
        return true;
      }
      return false;
    } on DioException catch (_) {}
    return false;
  }
}
