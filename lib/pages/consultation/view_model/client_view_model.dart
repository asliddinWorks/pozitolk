
import 'package:flutter/cupertino.dart';
import 'package:pozitolk/pages/consultation/data/consultation_repo/consultation_repo.dart';
import 'package:pozitolk/pages/consultation/data/models/client_model.dart';
import 'package:pozitolk/pages/consultation/data/models/payment_model.dart';
import 'package:pozitolk/pages/consultation/data/models/statistics_model.dart';

class ClientViewModel extends ChangeNotifier {
  ClientViewModel(this.consultationRepo);
  final ConsultationRepo consultationRepo;

  List<ClientModel> clients = [];
  List<PaymentModel> payments = [];
  StatisticsModel? statisticsModel;
  bool isLoading = false;

  Future<void> getClients() async {
    isLoading = true;
    notifyListeners();
    clients = await consultationRepo.getClients();
    isLoading = false;
    notifyListeners();
  }
  Future<void> getPayments() async {
    isLoading = true;
    notifyListeners();
    payments = await consultationRepo.getPayments();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getStatistics() async {
    isLoading = true;
    notifyListeners();
    statisticsModel= await consultationRepo.getStatistics();
    isLoading = false;
    notifyListeners();
  }

  String monthToRussianShort(String yearMonth) {
    // yearMonth: "2024-08"
    final parts = yearMonth.split('-');
    if (parts.length != 2) return '';

    final month = int.tryParse(parts[1]);
    if (month == null || month < 1 || month > 12) return '';

    const months = [
      'Янв',
      'Фев',
      'Мар',
      'Апр',
      'Май',
      'Июн',
      'Июл',
      'Авг',
      'Сен',
      'Окт',
      'Ноя',
      'Дек'
    ];

    return months[month - 1];
  }

  double calculateInterval(double maxValueForChart) {
    if (maxValueForChart <= 0) {
      // Himoya uchun, garchi bizda minimum 0 bo'lsa ham
      return 1.0;
    }
    if (maxValueForChart <= 5) {
      return 1.0;
    } else if (maxValueForChart <= 25) {
      return 5.0;
    } else {
      return 25.0;
    }
  }

  double calculateDynamicSpacerHeight(double actualMaxValue) {
    if (actualMaxValue <= 0) {
      return 0.2; // Agar ma'lumotlar yo'q yoki 0 bo'lsa, minimal bo'shliq
    }

    // Proportsional hisoblash (masalan, ma'lumotning1% i)
    double proportionalSpacer = actualMaxValue * 0.1;

    // Minimal va maksimal chegaralarni qo'llash
    // clamp(lowerLimit, upperLimit) funksiyasi qiymatni shu oraliqda ushlab turadi.
    return proportionalSpacer.clamp(0.2, 2.0);
  }

  final List<SessionDynamic> sessionList = [
    SessionDynamic(sessions: 3, clients: 116, diff: "-15"),
    SessionDynamic(sessions: 4, clients: 97, diff: "-12"),
    SessionDynamic(sessions: 1, clients: 150, diff: ""),
    SessionDynamic(sessions: 2, clients: 50, diff: "-5"),
    SessionDynamic(sessions: 5, clients: 130, diff: "-20"),
  ];

}