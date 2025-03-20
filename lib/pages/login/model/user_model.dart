
class UserModel {
  UserModel({this.phone, this.code, this.isPsychologist});
  String? phone;
  String? code;
  bool? isPsychologist;

  Map<String, dynamic> get toJsonRegister => {
    'phone' : phone,
  };

  Map<String, dynamic> get toJsonConfirm => {
    'phone' : phone,
    'code' : code,
    'is_psychologist' : isPsychologist,
  };
}