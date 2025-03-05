
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';

void callNumber(String phoneNumber) async {
  String telUrl = "tel:$phoneNumber"; // Yoki "tel://$phoneNumber"

  if (await canLaunchUrlString(telUrl)) {
    bool launched = await launchUrlString(telUrl);
    if (!launched) {
      if (kDebugMode) {
        print("Ilova URL'ni ocholmadi.");
      }
    }
  } else {
    if (kDebugMode) {
      print("Raqamni terib bo‘lmadi!");
    }
  }
}

