import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pozitolk/pages/consultation/data/models/client_model.dart';
import 'package:pozitolk/pages/consultation/data/models/message_model.dart';
import 'package:pozitolk/pages/consultation/data/models/notes_model.dart';
import 'package:pozitolk/pages/login/model/user_model.dart';
import '../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../di_service.dart';

abstract class ConsultationRepo {
  Future<bool> patchPersonalData(BuildContext context, UserModel userModel);
  Future<void> postUser();
  Future<bool> patchContact(BuildContext context, UserModel userModel);
  Future<bool> patchSpecialization(BuildContext context, UserModel userModel);
  Future<bool> patchClient(BuildContext context, UserModel userModel);
  Future<bool> patchTable(List data);
  Future<bool> patchEducation(BuildContext context, FormData formData);
  Future<UserModel> getUser();
  Future<Map> getTable();
  Future<(List<SlotModel>, List<ScheduleModel>)> getSlots(String startDate, String endDate);
  Future<bool> postSlot(String dateTime, bool isAvailable);
  Future<List<NotesModel>> getNotes(int id);
  Future<bool> postNotes(NotesModel notesModel);
  Future<List<ClientModel>> getClients();
}

class ConsultationImpl extends ConsultationRepo {
  ConsultationImpl(this.dio);
  final Dio dio;

  @override
  Future<bool> patchPersonalData(
      BuildContext context, UserModel userModel) async {
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
  Future<bool> patchSpecialization(
      BuildContext context, UserModel userModel) async {
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
    } on DioException catch (_) {}
    return false;
  }

  @override
  Future<bool> patchClient(BuildContext context, UserModel userModel) async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.patch(
        'cabinet/change-self-psychologist/',
        options: Options(
          headers: headerWithAuth(token),
        ),
        data: userModel.toJsonClient(),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return true;
      }
      return false;
    } on DioException catch (_) {}
    return false;
  }

  @override
  Future<bool> patchTable(List data) async {
    try {
      print('data ${data}');
      final token = await AppLocalData.getUserToken;
      Response response = await dio.post(
        '/cabinet/adjust-schedule/',
        options: Options(
          headers: headerWithAuth(token),
        ),
        data: data,
      );

      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return true;
      }
      return false;
    } on DioException catch (_) {}
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
  Future<Map> getTable() async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '/session/my_schedule/',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return response.data;
      }
      return {};
    } on DioException catch (_) {
      // print('AAAAAAAAAAAAAAA');
      // print(e);
    }
    return {};
  }

  @override
  Future postUser() async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio
          .patch('cabinet/change-self-psychologist/?user_type=psychologist',
          options: Options(
            headers: headerWithAuth(token),
          ),
          data: {
            'phone_number': '+998999999999',
          });
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
  Future<bool> postSlot(String dateTime, bool isAvailable) async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.post(
          'https://backend.xn--g1acgdmcd1a.xn--p1ai/session/timeslots/update_availability/?user_type=psychologist',
          options: Options(
            headers: headerWithAuth(token),
          ),

          data: [
            {"datetime": dateTime, "is_available": isAvailable}
          ]
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      // print('AAAAAAAAAAAAAAA');
      print('eeeeerrrrrr $e');
    }
    return false;
  }

  @override
  Future<(List<SlotModel>, List<ScheduleModel>)> getSlots(String startDate, String endDate) async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        // '/session/message-list/$chatId/?page=$page&page_size=$pageSize',
          'https://backend.xn--g1acgdmcd1a.xn--p1ai/session/my_schedule/?start_date=$startDate&end_date=$endDate&user_type=psychologist',
          // 'fuel-app/owner-fuel/?page=$page&page_size=$pageSize',
          options: Options(
            headers: headerWithAuth(token),
          ),
          queryParameters: {'start_date': startDate, 'end_date': endDate});
      // print('id $chatId, page $page, pageSize $pageSize, response ${response.data}');
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        List<SlotModel> list = [];
        List list3 = [];
        List<ScheduleModel> scheduleList = [];
        list3 = response.data['sessions'];
        for (var item in list3) {
          final model = ScheduleModel.fromJson(item);
          scheduleList.add(model);
        }
        List list2 = [];
        list2 = response.data['slots'];
        for (int i = 0; i < list2.length; i++) {}
        for (var item in list2) {
          final model = SlotModel.fromJson(item);
          list.add(model);
        }
        return (list, scheduleList);
      }
    } catch (e) {
      return (<SlotModel>[], <ScheduleModel>[]);
    }
    return (<SlotModel>[], <ScheduleModel>[]);
  }

  @override
  Future<List<NotesModel>> getNotes(int id) async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        'session/notes/?user_type=psychologist&client_id=$id',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        List<NotesModel> list = [];
        List list2 = [];
        list2 = response.data;
        // for (int i = 0; i < list2.length; i++) {}
        for (var item in list2) {
          final model = NotesModel.fromJson(item);
          list.add(model);
        }
        return list;
      }
    } catch (e) {
      return [];
    }
    return [];
  }

  @override
  Future<bool> postNotes(NotesModel notesModel) async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.post(
        'session/notes/?user_type=psychologist',
        options: Options(
          headers: headerWithAuth(token),
        ),
        data: notesModel.toJson(),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return true;
      }
      return false;
    } on DioException catch (_) {}
    return false;
  }

  @override
  Future<List<ClientModel>> getClients() async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        'session/my_client/',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        List<ClientModel> list = [];
        List list2 = [];
        list2 = response.data;
        for (var item in list2) {
          final model = ClientModel.fromJson(item);
          list.add(model);
        }
        return list;
      }
    } catch (e) {
      return [];
    }
    return [];
  }
}
