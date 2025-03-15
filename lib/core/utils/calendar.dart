import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// Future<void> selectDate(BuildContext context, TextEditingController dateController) async {
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(1900),
//     lastDate: DateTime(2101),
//   );
//   if (picked != null) {
//     // Sanani formatlash
//     String formattedDate = DateFormat('yyyy-MM-dd').format(picked); // 01/11/2024 ko'rinishida
//     dateController.text = formattedDate;
//   }
// }

Future<void> selectDateTime(BuildContext context, TextEditingController dateController) async {
  // Sanani tanlash
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    // Soat va daqiqani tanlash
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Sanani va vaqtni birlashtirish
      final DateTime combinedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      // Formatlash: kun/oy/yil va soat:daqiqa
      String formattedDateTime = DateFormat('yyyy-MM-dd    HH:mm').format(combinedDateTime);
      dateController.text = formattedDateTime; // Natijani controllerga yuborish
    }
  }
}