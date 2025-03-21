import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitolk/core/extension/context_extension.dart';

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

Future<void> selectDate(BuildContext context, TextEditingController dateController) async {
//   // Sanani tanlash
//   final DateTime? pickedDate = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(1900),
//     lastDate: DateTime(2101),
//   );

  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1990),
    lastDate: DateTime(2050),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: context.color.text, // header background color
            // onPrimary: Colors.black, // header text color
            onSurface: context.color.text, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: context.color.text, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    // // Soat va daqiqani tanlash
    // final TimeOfDay? pickedTime = await showTimePicker(
    //   context: context,
    //   initialTime: TimeOfDay.now(),
    // );

      final DateTime combinedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      // Formatlash: kun/oy/yil va soat:daqiqa
      String formattedDateTime = DateFormat('yyyy-MM-dd').format(combinedDateTime);
      dateController.text = formattedDateTime; // Natijani controllerga yuborish
    }
}