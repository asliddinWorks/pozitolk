import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_style.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: colorLightScheme.primary,
    colorScheme: colorLightScheme,

    extensions: <ThemeExtension<dynamic>>[
      AppColors.light,
      AppTextStyle.light,
    ],

    /// Scaffold Background Color
    scaffoldBackgroundColor: colorLightScheme.surface,
    /// AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: false,
      surfaceTintColor: AppColors.light.background1,
    ),

    /// TextField Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.light.text,
      contentPadding: const EdgeInsets.all(5),
      // hintStyle: AppTextStyle.light.body2.copyWith(
      //   color: AppColors.light.primary,
      // ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: AppColors.light.text,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: AppColors.light.text,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: colorLightScheme.error,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: colorLightScheme.error,
        ),
      ),
      alignLabelWithHint: true,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.light.text),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.light.text),
      )
    ),
    // textSelectionTheme: TextSelectionThemeData(
    //   cursorColor: Colors.black, // Kursor rangi
    //   selectionColor: Colors.grey[300], // Tanlangan text backgroundi
    //   selectionHandleColor: Colors.black, // Tanlash tugmalarining rangi
    // ),
    // popupMenuTheme: PopupMenuThemeData(
    //   color: Colors.white, // Popup menyu background rangi
    //   textStyle: TextStyle(color: Colors.black), // Matn rangi
    // ),
  );
}
