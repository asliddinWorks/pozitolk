
import 'package:flutter/cupertino.dart';
import 'package:pozitolk/pages/consultation/data/consultation_repo/consultation_repo.dart';
import 'package:pozitolk/pages/consultation/data/models/client_model.dart';

class ClientViewModel extends ChangeNotifier {
  ClientViewModel(this.consultationRepo);
  final ConsultationRepo consultationRepo;

  List<ClientModel> clients = [];
  bool isLoading = false;

  Future<void> getClients() async {
    isLoading = true;
    notifyListeners();
    clients = await consultationRepo.getClients();
    isLoading = false;
    notifyListeners();
  }
}