
import 'package:flutter/cupertino.dart';
import 'package:pozitolk/pages/consultation/data/consultation_repo/consultation_repo.dart';
import 'package:pozitolk/pages/consultation/data/models/client_model.dart';
import 'package:pozitolk/pages/consultation/data/models/payment_model.dart';

class ClientViewModel extends ChangeNotifier {
  ClientViewModel(this.consultationRepo);
  final ConsultationRepo consultationRepo;

  List<ClientModel> clients = [];
  List<PaymentModel> payments = [];
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
}