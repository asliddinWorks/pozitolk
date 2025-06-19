import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/core/data/data_source/local/app_local_data.dart';
import 'package:pozitolk/di_service.dart';
import 'package:pozitolk/pages/consultation/data/consultation_repo/consultation_repo.dart';
import 'package:pozitolk/pages/consultation/data/models/notes_model.dart';
import 'package:pozitolk/pages/consultation/pages/widgets/notes_dialog.dart';
import 'package:pozitolk/pages/login/model/user_model.dart';
import '../../../core/tools/toast_bar.dart';
import '../../../router/router.dart';
import '../data/models/message_model.dart';
import 'chat_view_model.dart';

class ConsultationViewModel extends ChangeNotifier {
  final ConsultationRepo consultationRepo;

  ConsultationViewModel(this.consultationRepo);

  final GlobalKey<ScaffoldState> key = GlobalKey();
  MotionTabBarController? motionTabBarController;

  bool isLoading = false;
  bool isShow = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  String selectNavigation = 'Клиенты';

  final readChat = ChatViewModel(getIt());

  TextEditingController dateController = TextEditingController();
  List<bool> drawerItem = List.generate(8, (index) => index == 2);
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

  List<bool> profileItem = List.generate(6, (index) => false);

  void onProfileItemSelected(int index) {
    profileItem = List.generate(profileItem.length, (index) => false);
    profileItem[index] = true;
    notifyListeners();
  }

  void onDrawerSelected(BuildContext context, int index)async {
    removePopup();
    drawerItem = List.generate(drawerItem.length, (index) => false);
    drawerItem[index] = true;
    // context.pop();
    key.currentState!.closeEndDrawer();
    if(index == 0) {
      context.go(RouteNames.schedule);
      selectNavigation = "Расписание";
      await Future.delayed(Duration(milliseconds: 50),);
      motionTabBarController?.index = 2;
    }
    // if(!readChat.isMessageOpen){
      if(index == 1) {
        readChat.isMessageOpen = false;
        context.go(RouteNames.consultationChat);
        selectNavigation = "Чаты";
        // await Future.delayed(Duration(milliseconds: 50),);
        // readChat.isMessageOpen = true;
        // motionTabBarController?.index = 3;
      }
    // }
    if(index == 2) {
      selectNavigation = "Клиенты";
      context.go(RouteNames.client);
      await Future.delayed(Duration(milliseconds: 50),);
      motionTabBarController?.index = 0;
    }
    if(index == 3) {
      // selectNavigation = "Клиенты";
      context.go(RouteNames.payment);
      // await Future.delayed(Duration(milliseconds: 50),);
      // motionTabBarController?.index = 0;
    }
    if(index == 4) {
      context.go(RouteNames.statistics);
      selectNavigation = "Статистика";
      await Future.delayed(Duration(milliseconds: 50),);
      motionTabBarController?.index = 1;
      // motionTabBarController?.index = 1;
    }
    if(index == 6) {
      // readChat.isMessageOpen = true;
      context.go(RouteNames.consultationHelp);
    }
    if(index == 7) {
      selectNavigation = "Настройки";
      context.go(RouteNames.psychologistSettings);
    }
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

  void onSettings(BuildContext context) {
    drawerItem = List.generate(8, (index) => false);
    drawerItem[7] = true;
    context.go(RouteNames.psychologistSettings);
    notifyListeners();
  }

  void onChat() {
    drawerItem = List.generate(8, (index) => false);
    drawerItem[1] = true;
    motionTabBarController?.index = 3;
    notifyListeners();
  }

  void onSetState() {
    notifyListeners();
  }

  List<TextEditingController> educationPlaceController = [];
  List<TextEditingController> educationYearController = [];

  List educationList = [];

  Future<void> patchEducation(BuildContext context) async {
    try {
      if (educationPlaceController.isEmpty || educationYearController.isEmpty) {
        showToast(context, 'Пожалуйста, Заполните все поля');
        return;
      }
      // EducationPsychologist educationPsychologist = EducationPsychologist();
      FormData formData = FormData();
      for (int i = 0; i < educationPlaceController.length; i++) {
        String place = educationPlaceController[i].text;
        String yearText = educationYearController[i].text;
        if (place.isEmpty || yearText.isEmpty) {
          showToast(context, 'Пожалуйста, Заполните все поля');
          return;
        }

        formData.fields.addAll([
          MapEntry("education[$i][text]", place),
          MapEntry("education[$i][year]", yearText),
        ]);
      }

      await consultationRepo.patchEducation(context, formData);

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
  int userId = 0;
  File? selectedImageFile;
  String? imageUrl;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController workingMethodController = TextEditingController();
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
      // if (phoneController.text.isEmpty) {
      //   showToast(context, 'Пожалуйста, Заполните все поля');
      //   return;
      // }

      final UserModel userModel = UserModel(
        workingMethods: workingMethodController.text,
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

  Future<void> patchClient(BuildContext context) async {
    try {
      // if (phoneController.text.isEmpty) {
      //   showToast(context, 'Пожалуйста, Заполните все поля');
      //   return;
      // }

      final UserModel userModel = UserModel(
        timezone: timeZone,
        sessionDuration: int.parse(sessionDuration),
      );
      isLoading = true;
      notifyListeners();
      await consultationRepo.patchClient(context, userModel);
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
      userModel = await consultationRepo.getUser(); // Malumotlarni kutamiz\
      userId = userModel.id ?? 0;
      nameController.text = userModel.name ?? '';
      dateController.text = userModel.dateOfBirth ?? '';
      selectLanguage = userModel.language ?? '';
      phoneController.text = userModel.phone ?? '';
      emailController.text = userModel.email ?? '';
      selectSex = userModel.sex == 'man' ? 'Мужской' : 'Женский';
      imageUrl = userModel.photo;
      workingMethodController.text = userModel.workingMethods ?? '';
      clientAge = userModel.clientAge == '18+' ? true : false;
      experienceWithIdentitySearch =
          userModel.experienceWithIdentitySearch ?? false;
      coupleTherapy = userModel.coupleTherapy ?? false;
      isChecked2 = userModel.notificationsPhone ?? false;
      isChecked3 = userModel.notificationsEmail ?? false;
      educationList = userModel.educationPsychologist ?? [];
      educationPlaceController.clear();
      educationYearController.clear();
      for (var education in educationList) {
        educationPlaceController
            .add(TextEditingController(text: education['text']));
        educationYearController
            .add(TextEditingController(text: education['year'].toString()));
      }
      timeZone = userModel.timezone ?? 'Europe/Moscow';
      sessionDuration = userModel.sessionDuration.toString();
      sessionDuration = userModel.sessionDuration.toString();
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


  void changeTable(index) {
    if (sessionDuration == '1') {
      if (greenIndexes[weekdays.indexOf(true)].contains(index)) {
        greenIndexes[weekdays.indexOf(true)].remove(index);
      } else {
        greenIndexes[weekdays.indexOf(true)].add(index);
      }
      notifyListeners();
    }
    if (sessionDuration == '2') {
      if (index == 23) {
        return;
      }
      if (greenIndexes[weekdays.indexOf(true)].contains(index) &&
          greenIndexes[weekdays.indexOf(true)].contains(index + 1)) {
        for (var i = 0; i < 2; i++) {
            // greenIndexes[weekdays.indexOf(true)].removeAt(index);
            greenIndexes[weekdays.indexOf(true)].remove(index + i);
            // print('removeeeee  ${index + i}');
        }
        notifyListeners();
        return;
      }
      if (!greenIndexes[weekdays.indexOf(true)].contains(index) &&
          !greenIndexes[weekdays.indexOf(true)].contains(index + 1)) {
        for (var i = 0; i < 2; i++) {
          greenIndexes[weekdays.indexOf(true)].add(index + i);
          // print('addddd  ${index + i}');
          // }
          // greenIndexes[weekdays.indexOf(true)].add(index);
        }
      }
      notifyListeners();
    }
    if (sessionDuration == '3') {
      if (index == 23 || index == 22) {
        return;
      }
      if (greenIndexes[weekdays.indexOf(true)].contains(index) &&
          greenIndexes[weekdays.indexOf(true)].contains(index + 1) &&
          greenIndexes[weekdays.indexOf(true)].contains(index + 2)) {
        for (var i = 0; i < 3; i++) {
            // greenIndexes[weekdays.indexOf(true)].removeAt(index);
            greenIndexes[weekdays.indexOf(true)].remove(index + i);
            // print('removeeeee  ${index + i}');
        }
        notifyListeners();
        return;
      }
      if (!greenIndexes[weekdays.indexOf(true)].contains(index) &&
          !greenIndexes[weekdays.indexOf(true)].contains(index + 1) &&
          !greenIndexes[weekdays.indexOf(true)].contains(index + 2)) {
        for (var i = 0; i < 3; i++) {
          greenIndexes[weekdays.indexOf(true)].add(index + i);
          // print('addddd  ${index + i}');
          // }
          // greenIndexes[weekdays.indexOf(true)].add(index);
        }
      }
      notifyListeners();
    }
    // if (greenIndexes[weekdays.indexOf(true)].contains(index)) {
    //   greenIndexes[weekdays.indexOf(true)].remove(index);
    // }else{
    //   greenIndexes[weekdays.indexOf(true)].add(index);
    // }
    // notifyListeners();
  }

  final List<String> times = List.generate(24, (index) => '$index:00');

  final List<int> orangeIndexes = [];

  List greenIndexes = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];

  List<Map<String, dynamic>> tableItems = [
  ];

  Future<void> patchTable(BuildContext context) async {
    try {
      // if (phoneController.text.isEmpty) {
      //   showToast(context, 'Пожалуйста, Заполните все поля');
      //   return;
      // }
      tableItems = [];
      print('vjnfvjnjnfvj ${greenIndexes}');
      for (int i = 0; i < greenIndexes.length; i++) {
        for (int j = 0; j < greenIndexes[i].length; j++) {
          // print('okk ');
          // print('okk  ${times[greenIndexes[i][j]]}');
          // print(TableModel(
          //   time: times[greenIndexes[i][j]],
          //   dayOfWeek: i.toString(),
          // ).toJson());
          tableItems.add(TableModel(
            time: times[greenIndexes[i][j]],
            dayOfWeek: i.toString(),
          ).toJson());
        }
        // print('iiiii  ${tableItems}');
      }
      isLoading = true;
      notifyListeners();
      // print('eerr');
      await consultationRepo.patchTable(tableItems);
      isLoading = false;
      notifyListeners();
    } catch (_) {
      isLoading = false;
    }
  }

  Future<void> getTable() async {
    isLoading = true;
    notifyListeners();

    try {
      Map data = await consultationRepo.getTable(); // Malumotlarni kutamiz\
      List<dynamic> slots = data['slots'] ?? [];

      // print('gggmmm');
      for (int i = 0; i < slots.length; i++) {
        // print('${slots[i]['day_of_week_index']}  ${slots[i]['day_of_week_index'].runtimeType}');
        // print('${slots[i]['time']}  ${slots[i]['time'].runtimeType}');
        // print('ggg  ${int.parse(slots[i]['time'].split(':')[0])}');
        if(!greenIndexes[slots[i]['day_of_week_index']].contains(int.parse(slots[i]['time'].split(':')[0]))){
          greenIndexes[slots[i]['day_of_week_index']].add(
            int.parse(slots[i]['time'].split(':')[0]),
          );
          // print('addddd  ${int.parse(slots[i]['time'].split(':')[0])}');
        }
      }

      notifyListeners();
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  bool selectedSlot = false;
  SlotModel? slotModel;
  SlotModel? slotModel2;
  DateTime slotDate = DateTime.now();
  bool clientAge = false;
  bool experienceWithIdentitySearch = false;
  bool coupleTherapy = false;

  String? timeZone = 'Europe/Moscow';
  String sessionDuration = '1';

  final List<Map<String, String>> timeZones = [
    {"name": "Kaliningrad (MSK–1, GMT+2)", "value": "Europe/Kaliningrad"},
    {"name": "Moskva (MSK, GMT+3)", "value": "Europe/Moscow"},
    {"name": "Samara (MSK+1, GMT+4)", "value": "Europe/Samara"},
    {"name": "Yekaterinburg (MSK+2, GMT+5)", "value": "Asia/Yekaterinburg"},
    {"name": "Omsk (MSK+3, GMT+6)", "value": "Asia/Omsk"},
    {"name": "Krasnoyarsk (MSK+4, GMT+7)", "value": "Asia/Krasnoyarsk"},
    {"name": "Irkutsk (MSK+5, GMT+8)", "value": "Asia/Irkutsk"},
    {"name": "Yakutsk (MSK+6, GMT+9)", "value": "Asia/Yakutsk"},
    {"name": "Vladivostok (MSK+7, GMT+10)", "value": "Asia/Vladivostok"},
    {"name": "Magadan (MSK+8, GMT+11)", "value": "Asia/Magadan"},
    {"name": "Kamchatka (MSK+9, GMT+12)", "value": "Asia/Kamchatka"},
  ];

  List<SlotModel> tableSelect = [
    SlotModel(
      // key: '2025-05-12 06:00',
      datetime: DateTime.parse("2025-05-12T12:00"),
      // hour: '06:00',
    ),
    SlotModel(
      // key: '2025-05-13 14:00',
      datetime: DateTime.parse("2025-05-17T12:00"),
      // hour: '14:00',
    ),
    // SlotModel(
    //   key: '2025-05-14 08:00',
    //   date: DateTime(2025, 5, 14),
    //   hour: '08:00',
    // ),
    // SlotModel(
    //   key: '2025-05-20 08:00',
    //   date: DateTime(2025, 5, 20),
    //   hour: '08:00',
    // ),
    // SlotModel(
    //   key: '2025-05-19 14:00',
    //   date: DateTime(2025, 5, 19),
    //   hour: '14:00',
    // ),
    // SlotModel(
    //   key: '2025-06-9 17:00',
    //   date: DateTime(2025, 6, 9),
    //   hour: '17:00',
    // ),
    SlotModel(
      // key: '2025-06-12 18:00',
      datetime: DateTime.parse("2025-05-17T14:00"),
      // hour: '18:00',
    ),
  ];

  Future getSlots(String startDate, String endDate) async {
    isLoading = true;
    notifyListeners();

    try {
      print(1133);
      final result = await consultationRepo.getSlots(startDate, endDate); // Malumotlarni kutamiz\
      tableSelect = result.$1;
      // tableSelect.map((m) => print(m.clientId)).toList();
      print(3344);
      // List<dynamic> slots = data['slots'] ?? [];
      // print('tableSelect: ${result.$2[2].startTime?? ''} ${result.$2[2].id?? ''}   nn   ${result.$1[0].datetime?? ''}');
      // print('gggmmm');
      // for (int i = 0; i < slots.length; i++) {
      //   // print('${slots[i]['day_of_week_index']}  ${slots[i]['day_of_week_index'].runtimeType}');
      //   // print('${slots[i]['time']}  ${slots[i]['time'].runtimeType}');
      //   // print('ggg  ${int.parse(slots[i]['time'].split(':')[0])}');
      //   if(!greenIndexes[slots[i]['day_of_week_index']].contains(int.parse(slots[i]['time'].split(':')[0]))){
      //     greenIndexes[slots[i]['day_of_week_index']].add(
      //       int.parse(slots[i]['time'].split(':')[0]),
      //     );
      //     // print('addddd  ${int.parse(slots[i]['time'].split(':')[0])}');
      //   }
      // }
      notifyListeners();
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> postSlot(String dateTime, bool isAvailable)async{
    try{
      await consultationRepo.postSlot(dateTime, isAvailable);
    }catch(e){
      print(e);
    }

  }
  final GlobalKey overlayKey = GlobalKey();
  // final List<GlobalKey> cellKeys = List.generate(35, (_) => GlobalKey());
  OverlayEntry? popupEntry;


  void removePopup() {
    popupEntry?.remove();
    popupEntry = null;
  }

  void showPopup(BuildContext context, TapDownDetails details, String label) {
    removePopup();
    // final renderBox = context.findRenderObject() as RenderBox;
    // final position = renderBox.localToGlobal(Offset.zero);

    popupEntry = OverlayEntry(
        builder: (context) => NotesDialog(details: details, label: label)
    );

    Overlay.of(context).insert(popupEntry!);
  }

  List<NotesModel> notes = [];
  TextEditingController noteController = TextEditingController();

  Future<void> getNotes()async{
    try{
      isLoading = true;
      notifyListeners();
      notes = await consultationRepo.getNotes(slotModel2!.clientId!);
      notes = notes.reversed.toList();
      print('notes: ${notes.length}');
      isLoading = false;
      notifyListeners();
    }catch(e){
      print(e);
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> postNote()async{
    try{
      if(noteController.text.isEmpty) return;
      NotesModel notesModel = NotesModel(text: noteController.text, id: slotModel2!.clientId!);
      isLoading = true;
      notifyListeners();
      await consultationRepo.postNotes(notesModel);
      await getNotes();
      isLoading = false;
      noteController.clear();
      notifyListeners();
    }catch(e){
      print(e);
      isLoading = false;
      notifyListeners();
    }
  }
}
