import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pozitolk/pages/login/model/user_model.dart';
import '../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../di_service.dart';

abstract class ConsultationRepo {
  Future<bool> patchPersonalData(BuildContext context, UserModel userModel);
  Future<void> postUser();
  Future<bool> patchContact(BuildContext context, UserModel userModel);
  Future<bool> patchSpecialization(BuildContext context, UserModel userModel);
  Future<bool> patchEducation(BuildContext context,  FormData formData);
  Future<UserModel> getUser();
}

class ConsultationImpl extends ConsultationRepo {
  ConsultationImpl(this.dio);
  final Dio dio;

  @override
  Future<bool> patchPersonalData(BuildContext context, UserModel userModel) async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.patch(
        'cabinet/change-self-psychologist/?user_type=psychologist',
        options: Options(
          headers: headerWithAuth(token),
          // headers: {
          //   'accept': 'application/json',
          //   'Authorization': 'Token $token', // Agar token `Token ` prefiksi bilan bo‘lsa
          //   'Content-Type': 'application/json',
          //   // 'X-CSRFTOKEN': csrfToken,
          // }
        ),
        data: userModel.toJsonPersonalData,
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return true;
      }
      return false;
    } on DioException catch (_) {}
    return false;
  }

  @override
  Future<bool> patchContact(BuildContext context, UserModel userModel) async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.patch(
        'cabinet/change-self-psychologist/?user_type=psychologist',
        options: Options(
          headers: headerWithAuth(token),
        ),
        data: userModel.toJsonContact(),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return true;
      }
      return false;
    } on DioException catch (_) {
      // print('AAAAAAAAAAAAAAA');
      // print(e);
    }
    return false;
  }
  @override
  Future<bool> patchSpecialization(BuildContext context, UserModel userModel) async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.patch(
        'cabinet/change-self-psychologist/',
        options: Options(
          headers: headerWithAuth(token),
        ),
        data: userModel.toJsonSpecialization(),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return true;
      }
      return false;
    } on DioException catch (_) {
    }
    return false;
  }

  @override
  Future<bool> patchEducation(BuildContext context, FormData formData) async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.post(
        'cabinet/psychologist_education/',
        options: Options(
          headers: headerWithAuth(token),
        ),
        data: formData,
      );
      print('okkk123');
      print(response.data);
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return true;
      }
      return false;
    } on DioException catch (_) {
      // print('AAAAAAAAAAAAAAA');
      // print(e);
    }
    return false;
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        'cabinet/self-psychologist/?user_type=psychologist',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return UserModel.fromJson(response.data);
      }
      return UserModel.fromJson(response.data);
    } on DioException catch (_) {
      // print('AAAAAAAAAAAAAAA');
      // print(e);
    }
    return UserModel.fromJson({});
  }

  @override
  Future postUser() async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.patch(
        'cabinet/change-self-psychologist/?user_type=psychologist',
        options: Options(
          headers: headerWithAuth(token),
        ),
        data: {
          'phone_number': '+998999999999',
        }
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return UserModel.fromJson(response.data);
      }
      return UserModel.fromJson(response.data);
    } on DioException catch (_) {
      // print('AAAAAAAAAAAAAAA');
      // print(e);
    }
    return UserModel.fromJson({});
  }
}
