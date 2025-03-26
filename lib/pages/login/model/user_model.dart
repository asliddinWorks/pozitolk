import 'package:dio/dio.dart';

class UserModel {
  UserModel({
    this.phone,
    this.code,
    this.isPsychologist,
    this.psychoTopics,
    this.education,
    this.phoneNumber,
    this.photo,
    this.name,
    this.label,
    this.experience,
    this.description,
    this.sex,
    this.price,
    this.email,
    this.notificationsPhone,
    this.notificationsEmail,
    this.dateOfBirth,
    this.language,
    this.timezone,
    this.sessionDuration,
    this.workingMethods,
    this.yourValues,
    this.howGetProfession,
    this.coupleTherapy,
    this.clientAge,
    this.experienceWithIdentitySearch,
    this.taxStatus,
    this.citizenship,
    this.address,
    this.inn,
    this.passport,
    this.registration,
    this.contract,
    this.innFile,
    this.retirementCertificate,
    this.imageFile,
  });
  String? phone;
  String? code;
  bool? isPsychologist;

  String? psychoTopics;
  String? education;
  String? phoneNumber;
  String? photo;
  String? name;
  String? label;
  int? experience;
  String? description;
  String? sex;
  double? price;
  String? email;
  bool? notificationsPhone;
  bool? notificationsEmail;
  String? dateOfBirth;
  String? language;
  String? timezone;
  int? sessionDuration;
  String? workingMethods;
  String? yourValues;
  String? howGetProfession;
  bool? coupleTherapy;
  String? clientAge;
  bool? experienceWithIdentitySearch;
  String? taxStatus;
  String? citizenship;
  String? address;
  String? inn;
  String? passport;
  String? registration;
  String? contract;
  String? innFile;
  String? retirementCertificate;
  MultipartFile? imageFile;

  Map<String, dynamic> get toJsonRegister => {
        'phone': phone,
      };

  Map<String, dynamic> get toJsonConfirm => {
        'phone': phone,
        'code': code,
        'is_psychologist': isPsychologist,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phone: json['phone'],
      psychoTopics: json['psycho_topics'],
      education: json['education_psychologist_write'],
      phoneNumber: json['phone_number'],
      photo: json['photo'],
      name: json['name'],
      label: json['label'],
      experience: json['experience'],
      description: json['description'],
      sex: json['sex'],
      price: json['price']?.toDouble(),
      email: json['email'],
      notificationsPhone: json['notifications_phone'],
      notificationsEmail: json['notifications_email'],
      dateOfBirth: json['date_of_birth'],
      language: json['language'],
      timezone: json['timezone'],
      sessionDuration: json['session_duration'],
      workingMethods: json['working_methods'],
      yourValues: json['your_values'],
      howGetProfession: json['how_get_profession'],
      coupleTherapy: json['couple_therapy'],
      clientAge: json['client_age'],
      experienceWithIdentitySearch: json['experience_with_identity_search'],
      taxStatus: json['tax_status'],
      citizenship: json['citizenship'],
      address: json['address'],
      inn: json['inn'],
      passport: json['passport'],
      registration: json['registration'],
      contract: json['contract'],
      innFile: json['inn_file'],
      retirementCertificate: json['retirement_certificate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'psycho_topics': psychoTopics,
      'education_psychologist_write': education,
      'phone_number': phoneNumber,
      'photo': photo,
      'name': name,
      'label': label,
      'experience': experience,
      'description': description,
      'sex': sex,
      'price': price,
      'email': email,
      'notifications_phone': notificationsPhone,
      'notifications_email': notificationsEmail,
      'date_of_birth': dateOfBirth,
      'language': language,
      'timezone': timezone,
      'session_duration': sessionDuration,
      'working_methods': workingMethods,
      'your_values': yourValues,
      'how_get_profession': howGetProfession,
      'couple_therapy': coupleTherapy,
      'client_age': clientAge,
      'experience_with_identity_search': experienceWithIdentitySearch,
      'tax_status': taxStatus,
      'citizenship': citizenship,
      'address': address,
      'inn': inn,
      'passport': passport,
      'registration': registration,
      'contract': contract,
      'inn_file': innFile,
      'retirement_certificate': retirementCertificate,
    };
  }

  FormData get toJsonPersonalData => FormData.fromMap({
        'name': name,
        // 'language': language,
        'phone_number': phoneNumber,
        'sex': sex,
        'date_of_birth': dateOfBirth,
        if (imageFile != null) 'photo': imageFile,
      });

  Map<String, dynamic> toJsonContact() {
    return {
      'phone_number': phoneNumber,
      'email': email,
      'notificationsPhone': notificationsPhone,
      'notificationsEmail': notificationsEmail,
    };
  }
  Map<String, dynamic> toJsonSpecialization() {
    return {
      'phone_number': phoneNumber,
      'clientAge': clientAge,
      'coupleTherapy': coupleTherapy,
      'experienceWithIdentitySearch': experienceWithIdentitySearch,
    };
  }
}

class EducationPsychologist {
  final int? id;
  final int? year;
  final String? text;
  final String? diploma;

  EducationPsychologist({
    this.id,
    this.year,
    this.text,
    this.diploma,
  });

  FormData get toJson => FormData.fromMap({
    'year': year,
    'text': text,
  });
}
