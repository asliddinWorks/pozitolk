import 'package:dio/dio.dart';
import 'package:pozitolk/pages/consultation/data/models/message_model.dart';

import '../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../di_service.dart';

abstract class ChatRepo {
  Future<List> getChatList();
  Future<List<MessageModel>> getChatPagination(int page, int pageSize, int chatId);
}

class ChatRepoImpl implements ChatRepo {
  ChatRepoImpl(this.dio);
  final Dio dio;

  @override
  Future<List> getChatList() async {
    try {
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        'session/chat-list/?user_type=psychologist',
        options: Options(
          headers: headerWithAuth(token),
        ),
        queryParameters: {
          'user_type': 'psychologist',
        },
      );
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        List<ChatModel> list = (response.data as List).map((e) => ChatModel.fromJson(e)).toList();
        return list;
      }
      return [];
    } on DioException catch (_) {
      // print('AAAAAAAAAAAAAAA');
      // print(e);
    }
    return [];
  }

  @override
  Future<List<MessageModel>> getChatPagination(int page, int pageSize, int chatId) async{
    try{
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '/session/message-list/$chatId/?page=$page&page_size=$pageSize',
          // 'fuel-app/owner-fuel/?page=$page&page_size=$pageSize',
          options: Options(
            headers: headerWithAuth(token),
          ),
        queryParameters: {
          'page': page,
          'page_size': pageSize
        }
      );
      print('id $chatId, page $page, pageSize $pageSize, response ${response.data}');
      if((response.statusCode == 200) || (response.statusCode == 201)){
        List<MessageModel> list = [];
        List list2 = [];
        list2 = response.data['results'];
        for(int i = 0; i < list2.length; i++){
        }
        for (var item in list2) {
          final model = MessageModel.fromJson(item);
          list.add(model);
        }
        return list;
      }
    }catch(e){
      return [];
    }
    return [];
  }

}