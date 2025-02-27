part of 'theme.dart';

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
      fillColor: colorLightScheme.surface,
      contentPadding: const EdgeInsets.all(5),
      // hintStyle: AppTextStyle.light.body2.copyWith(
      //   color: AppColors.light.primary,
      // ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: AppColors.light.primaryVar2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: AppColors.light.primaryVar2,
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
  );
}
