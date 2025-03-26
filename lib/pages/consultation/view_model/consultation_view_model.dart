import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/core/data/data_source/local/app_local_data.dart';
import 'package:pozitolk/pages/consultation/data/consultation_repo/consultation_repo.dart';
import 'package:pozitolk/pages/login/model/user_model.dart';
import '../../../core/tools/toast_bar.dart';
import '../../../router/router.dart';

class ConsultationViewModel extends ChangeNotifier {
  final ConsultationRepo consultationRepo;

  ConsultationViewModel(this.consultationRepo);

  final GlobalKey<ScaffoldState> key = GlobalKey();
  MotionTabBarController? motionTabBarController;

  bool isLoading = false;

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  TextEditingController dateController = TextEditingController();
  List<bool> drawerItem = List.generate(8, (index) => index == 0);
  List<String> drawerText = [
    'Расписание',
    'Чаты',
    'Клиенты',
    'Оплата',
    'Статистика',
    'События',
    'Помощь',
  ];

  List<String> drawerIcon = [
    AppIcons.icSchedule,
    AppIcons.icDrawerChat,
    AppIcons.icUsers,
    AppIcons.icPayment,
    AppIcons.icStatistics,
    AppIcons.icEvents,
    AppIcons.icHelp2,
  ];

  List<bool> isOpen = List.generate(6, (index) => false);
  List<String> faqTitle = [
    'Приветствие от сооснователя сервиса',
    'Начало сессии с клиентом',
    'Назначение, отмена, перенос сессий',
    'Часовые пояса',
    'Что если клиент просит перенести сессию, а кнопки нет?',
    'Профиль и настройки',
  ];
  List<String> faqText = [
    'Друзья, привет! Добро пожаловать в профессиональное сообщество сервиса '
        'онлайн-психотерапии “ПозиТолк”. Мы рады, что вы стали частью нашего '
        'терапевтического пространства, потому что чем больше хороших специалистов '
        ' в нем будет, тем оно будет шире, глубже и плодотворнее. Мы уверены, что '
        'у любого большого начинания должна быть большая цель и миссия, намерение, '
        'на которое это новое начинание будет опираться. Поэтому перед тем, как вы '
        'приступите к работе, мы хотели бы поподробнее рассказать о том, что представляет '
        'из себя сервис “ПозиТолк».  Ссылка для входа на платформу  Вы можете войти '
        'на сервис с любого устройства (компьютер, планшет, смартфон) по этой '
        'ссылке - https://pozitalk.ru/therapist Сохраните её себе, пожалуйста, где-нибудь, '
        'чтобы всегда иметь к ней доступ  Если по какой-то причине вам не '
        'приходит код по смс, вы можете воспользоваться входом по электронной почте, '
        'привязанной к сервису  Общие настройки системы  У вас должен быть браузер '
        'Chrome последней версии; Firefox, Safari и Яндекс.Браузер также будут работать, '
        'но Хром лучше всех; Проверьте скорость интернет подключения: '
        'https://yandex.ru/internet/ , если показывает что скорость выше '
        '1МБайт/с — то это просто прекрасно; Всегда проверяйте что на момент сессии '
        'у вас выключены торренты, скачивания и любые другие сервисы, которые могут '
        'отъедать трафик и влиять на качество связи; Убедитесь что ваши часы '
        'синхронизированы и у вас правильное время на компьютере; точное время '
        'всегда можно посмотреть здесь: https://yandex.ru/time...',
    '',
    '',
    '',
    '',
    '',
  ];

  List<bool> profileItem = List.generate(6, (index) => index == 0);

  void onProfileItemSelected(int index) {
    profileItem = List.generate(profileItem.length, (index) => false);
    profileItem[index] = true;
    notifyListeners();
  }

  void onDrawerSelected(BuildContext context, int index) {
    drawerItem = List.generate(drawerItem.length, (index) => false);
    drawerItem[index] = true;
    context.pop();
    notifyListeners();
  }

  void onOpen(int index) {
    if (isOpen[index] == true) {
      isOpen[index] = false;
    } else {
      isOpen = List.generate(isOpen.length, (index) => false);
      isOpen[index] = true;
    }
    notifyListeners();
  }

  void onSettings() {
    drawerItem = List.generate(8, (index) => false);
    drawerItem[7] = true;
    notifyListeners();
  }

  void onSetState() {
    notifyListeners();
  }

  List<TextEditingController> educationPlaceController = [];
  List<TextEditingController> educationYearController = [];

  List<EducationPsychologist> educationList = [];

  Future<void> patchEducation(BuildContext context) async {
    try {
      if (educationPlaceController.isEmpty || educationYearController.isEmpty) {
        showToast(context, 'Пожалуйста, Заполните все поля');
        return;
      }

      for (int i = 0; i < educationPlaceController.length; i++) {
        String place = educationPlaceController[i].text;
        String yearText = educationYearController[i].text;
        if (place.isEmpty || yearText.isEmpty) {
          showToast(context, 'Пожалуйста, Заполните все поля');
          return;
        }

        isLoading = true;
        notifyListeners();

        if (place.isNotEmpty && yearText.isNotEmpty) {
          int year = int.tryParse(yearText) ?? 0; // Agar son bo‘lmasa, 0 bo‘ladi
          EducationPsychologist education = EducationPsychologist(
            // id: i, // ID backend tomonidan generatsiya qilinishi mumkin
            year: year,
            text: place,
            // diploma: "string",
          );
          await consultationRepo.patchEducation(context, education);

        }
      }

      isLoading = false;
      notifyListeners();

    } catch (_) {
      isLoading = false;
    }
  }

  void onExit(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await AppLocalData.removeAll();
    context.go(RouteNames.login);
    isLoading = false;
    notifyListeners();
  }

  File? selectedImageFile;
  String? imageUrl;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? selectSex;
  String selectLanguage = 'Русский';
  List<String> sexItem = ['Мужской', 'Женский'];

  Future<void> patchPersonalData(BuildContext context) async {
    try {
      if (nameController.text.isEmpty ||
          phoneController.text.isEmpty ||
          dateController.text.isEmpty ||
          selectSex!.isEmpty ||
          selectSex == null) {
        showToast(context, 'Пожалуйста, Заполните все поля');
        return;
      }

      MultipartFile? multipartFile;
      if (selectedImageFile != null) {
        multipartFile = await MultipartFile.fromFile(selectedImageFile!.path);
      }
      final UserModel userModel = UserModel(
        name: nameController.text,
        dateOfBirth: dateController.text,
        sex: selectSex == 'Мужской' ? 'man' : 'woman',
        // language: selectLanguage,
        phoneNumber: phoneController.text,
        imageFile: multipartFile,
      );
      isLoading = true;
      notifyListeners();
      await consultationRepo.patchPersonalData(context, userModel);
      isLoading = false;
      notifyListeners();

      // if (vinController.text.contains('@')) {
      //   showToast('Пожалуйста, введите действительный адрес электронной почты');
      //   return;
      // }
      {}
    } catch (_) {
      isLoading = false;
    }
  }

  Future<void> patchContact(BuildContext context) async {
    try {
      if (emailController.text.isEmpty || phoneController.text.isEmpty) {
        showToast(context, 'Пожалуйста, Заполните все поля');
        return;
      }

      bool isValidEmail(String email) {
        String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        RegExp regex = RegExp(pattern);
        return regex.hasMatch(email);
      }

      if (!isValidEmail(emailController.text)) {
        showToast(context,
            'Пожалуйста, введите действительный адрес электронной почты');
        return;
      }

      final UserModel userModel = UserModel(
        phoneNumber: phoneController.text,
        email: emailController.text,
        notificationsPhone: isChecked2,
        notificationsEmail: isChecked3,
      );
      isLoading = true;
      notifyListeners();
      await consultationRepo.patchContact(context, userModel);
      isLoading = false;
      notifyListeners();

      // if (vinController.text.contains('@')) {
      //   showToast('Пожалуйста, введите действительный адрес электронной почты');
      //   return;
      // }
    } catch (_) {
      isLoading = false;
    }
  }

  Future<void> patchSpecialization(BuildContext context) async {
    try {
      if (phoneController.text.isEmpty) {
        showToast(context, 'Пожалуйста, Заполните все поля');
        return;
      }

      final UserModel userModel = UserModel(
        phoneNumber: phoneController.text,
        clientAge: clientAge ? '18+' : '16+',
        coupleTherapy: coupleTherapy,
        experienceWithIdentitySearch: experienceWithIdentitySearch,
      );
      isLoading = true;
      notifyListeners();
      await consultationRepo.patchSpecialization(context, userModel);
      isLoading = false;
      notifyListeners();
    } catch (_) {
      isLoading = false;
    }
  }

  UserModel userModel = UserModel();

  Future<void> getUser() async {
    isLoading = true;
    notifyListeners();

    try {
      userModel = await consultationRepo.getUser(); // Malumotlarni kutamiz
      nameController.text = userModel.name ?? '';
      dateController.text = userModel.dateOfBirth ?? '';
      selectLanguage = userModel.language ?? '';
      phoneController.text = userModel.phone ?? '';
      emailController.text = userModel.email ?? '';
      selectSex = userModel.sex == 'man' ? 'Мужской' : 'Женский';
      imageUrl = userModel.photo;
      clientAge = userModel.clientAge == '18+' ? true : false;
      experienceWithIdentitySearch =
          userModel.experienceWithIdentitySearch ?? false;
      coupleTherapy = userModel.coupleTherapy ?? false;
      isChecked2 = userModel.notificationsPhone ?? false;
      isChecked3 = userModel.notificationsEmail ?? false;
      notifyListeners();
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<String> weekdaysItem = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  List<bool> weekdays = List.generate(7, (index) => index == 0);

  void onWeekdaySelected(int index) {
    weekdays = List.generate(7, (index) => false);
    weekdays[index] = true;
    notifyListeners();
  }

  final List<String> times = List.generate(24, (index) => '$index:00');

  final List<int> orangeIndexes = [1, 2, 3, 12, 14, 21];
  final List<int> grayIndexes = [5, 6, 13, 15, 17, 18, 22];

  bool clientAge = false;
  bool experienceWithIdentitySearch = false;
  bool coupleTherapy = false;
}
