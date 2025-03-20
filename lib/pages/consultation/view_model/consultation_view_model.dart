
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/core/data/data_source/local/app_local_data.dart';

import '../../../router/router.dart';

class ConsultationViewModel extends ChangeNotifier {
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
  List <String> faqText = [
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
    if (isOpen[index] == true){
      isOpen[index] = false;
    }else{
      isOpen = List.generate(isOpen.length, (index) => false);
      isOpen[index] = true;
    }
    notifyListeners();
  }

  void onSettings(){
    drawerItem = List.generate(8, (index) => false);
    drawerItem[7] = true;
    notifyListeners();
  }

  void onSetState(){
    notifyListeners();
 }

  List<TextEditingController> educationPlaceController = [];
  List<TextEditingController> educationYearController = [];

  void onExit(BuildContext context)async{
    isLoading = true;
    notifyListeners();
    await AppLocalData.removeAll();
    context.go(RouteNames.login);
    isLoading = false;
    notifyListeners();
  }
}