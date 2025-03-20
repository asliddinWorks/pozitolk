
class AppRemoteData {

  static Future<void> updateToken() async {
    // try {
    //   String? refreshToken = await AppLocalData.getUserRefreshToken;
    //   print(refreshToken);
    //   if (refreshToken == null) return;
    //   Dio dio = Dio();
    //   Response response = await dio.post(
    //     'http://45.153.189.178:8000/api/token/refresh/',
    //     data: {
    //       'refresh' : refreshToken,
    //     },
    //     options: Options(
    //         headers: {
    //           'accept': 'application/json',
    //           'Content-Type': 'application/json',
    //         }
    //     ),
    //   );
    //
    //   if (response.statusCode == 200) {
    //     await AppLocalData.saveUserToken(response.data['access']);
    //     await AppLocalData.saveUserRefreshToken(response.data['refresh']);
    //   }
    // } on DioException catch (e) {
    //   await AppLocalData.removeAll();
    // }

  }

  // static UserModel? userModel = UserModel();
  //
  // static Future<List<UserModel>> getUsers() async {
  //   try {
  //     var response = await getIt.get<Dio>().get(
  //       'users/',
  //     );
  //     if ((response.statusCode == 200) || (response.statusCode == 201)) {
  //       List list = response.data;
  //       List<UserModel> listUser = [];
  //       for (var element in list) {
  //         UserModel userModel = UserModel.fromJsonContent(element);
  //         listUser.add(userModel);
  //       }
  //       return listUser;
  //     }
  //     return [];
  //   } catch (e) {
  //     return [];
  //   }
  // }
  //
  // static Future<List<UserModel>> searchUsers(String username) async {
  //   try {
  //     var response = await getIt.get<Dio>().get(
  //       (username.isEmpty) ?
  //       'users/' :
  //       'users/?search=$username',
  //     );
  //     if ((response.statusCode == 200) || (response.statusCode == 201)) {
  //       String myUserName = await AppLocalData.getUserName ?? '';
  //       List list = response.data;
  //       List<UserModel> listUser = [];
  //       for (var element in list) {
  //         UserModel userModel = UserModel.fromJsonContent(element);
  //         if (myUserName != userModel.username) listUser.add(userModel);
  //       }
  //       return listUser;
  //     }
  //     return [];
  //   } catch (e) {
  //     return [];
  //   }
  // }
}