import 'package:flutter/material.dart';
import 'app_colors.dart';

/// custom text styles
class AppTextStyle extends ThemeExtension<AppTextStyle> {
  AppTextStyle({
    required this.s16w400,
    // required this.body2,
    // required this.body3,
    // required this.body4,
    // required this.body5,
    // required this.button1,
    // required this.button2,
    // required this.button3,
    // required this.button4,
    // required this.title1,
    // required this.title2,
    // required this.title3,
    // required this.title4,
    // required this.title5,
    // required this.subTitle1,
    // required this.subTitle2,
    // required this.subTitle3,
    // required this.subTitle4,
  });

  final TextStyle s16w400;
  // final TextStyle body2;
  // final TextStyle body3;
  // final TextStyle body4;
  // final TextStyle body5;
  //
  // final TextStyle button1;
  // final TextStyle button2;
  // final TextStyle button3;
  // final TextStyle button4;
  //
  // final TextStyle title1;
  // final TextStyle title2;
  // final TextStyle title3;
  // final TextStyle title4;
  // final TextStyle title5;
  //
  // final TextStyle subTitle1;
  // final TextStyle subTitle2;
  // final TextStyle subTitle3;
  // final TextStyle subTitle4;

  /// new text styles

  static AppTextStyle light = AppTextStyle(
    s16w400: TextStyle(
      fontFamily: 'MV-Crooker',
      fontSize: 16.5,
      fontWeight: FontWeight.w400,
      color: AppColors.light.primary,
    ),
    // body2: GoogleFonts.workSans(
    //   fontSize: 15,
    //   fontWeight: FontWeight.w400,
    //   color: AppColors.light.text,
    // ),
    // body3: GoogleFonts.roboto(
    //   fontSize: 14,
    //   fontWeight: FontWeight.w400,
    //   color: AppColors.light.text,
    // ),
    // body4: GoogleFonts.inter(
    //   fontSize: 12,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.light.text,
    // ),
    // body5: GoogleFonts.workSans(
    //   fontSize: 12,
    //   fontWeight: FontWeight.w500,
    //   color: AppColors.light.text,
    // ),
    // button1: GoogleFonts.workSans(
    //   fontSize: 15,
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.light.text,
    // ),
    // button2: GoogleFonts.roboto(
    //   fontSize: 16,
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.light.text,
    // ),
    // button3: GoogleFonts.workSans(
    //   fontSize: 13,
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.light.text,
    // ),
    // button4: GoogleFonts.roboto(
    //   fontSize: 16,
    //   fontWeight: FontWeight.w400,
    //   color: AppColors.light.text,
    // ),
    // title1: GoogleFonts.workSans(
    //   fontSize: 16,
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.light.primary,
    // ),
    // title2: GoogleFonts.workSans(
    //   fontSize: 22,
    //   fontWeight: FontWeight.w500,
    //   color: AppColors.light.primary,
    // ),
    // title3: GoogleFonts.workSans(
    //   fontSize: 20,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.light.primary,
    // ),
    // title4: GoogleFonts.roboto(
    //   fontSize: 20,
    //   fontWeight: FontWeight.w300,
    //   color: AppColors.light.primary,
    // ),
    // title5: GoogleFonts.workSans(
    //   fontSize: 28,
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.light.primary,
    // ),
    // subTitle1: GoogleFonts.workSans(
    //   fontSize: 15,
    //   fontWeight: FontWeight.w500,
    //   color: AppColors.light.primary,
    // ),
    // subTitle2: GoogleFonts.workSans(
    //   fontSize: 12,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.light.primary,
    // ),
    // subTitle3: GoogleFonts.roboto(
    //   fontSize: 16,
    //   fontWeight: FontWeight.w300,
    //   color: AppColors.light.primary,
    // ),
    // subTitle4: GoogleFonts.workSans(
    //   fontSize: 14,
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.light.primary,
    // ),
  );

  @override
  ThemeExtension<AppTextStyle> copyWith({
    TextStyle? s16w400,
    TextStyle? body2,
    TextStyle? body3,
    TextStyle? body4,
    TextStyle? body5,
    TextStyle? button1,
    TextStyle? button2,
    TextStyle? button3,
    TextStyle? button4,
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? title4,
    TextStyle? title5,
    TextStyle? subTitle1,
    TextStyle? subTitle2,
    TextStyle? subTitle3,
    TextStyle? subTitle4,
  }) {
    return AppTextStyle(
      s16w400: s16w400 ?? this.s16w400,
      // body2: body2 ?? this.body2,
      // body3: body3 ?? this.body3,
      // body4: body4 ?? this.body4,
      // body5: body5 ?? this.body5,
      // button1: button1 ?? this.button1,
      // button2: button2 ?? this.button2,
      // button3: button3 ?? this.button3,
      // button4: button4 ?? this.button4,
      // title1: title1 ?? this.title1,
      // title2: title2 ?? this.title2,
      // title3: title3 ?? this.title3,
      // title4: title4 ?? this.title4,
      // title5: title5 ?? this.title5,
      // subTitle1: subTitle1 ?? this.subTitle1,
      // subTitle2: subTitle2 ?? this.subTitle2,
      // subTitle3: subTitle3 ?? this.subTitle3,
      // subTitle4: subTitle4 ?? this.subTitle4,
    );
  }

  @override
  ThemeExtension<AppTextStyle> lerp(
      covariant ThemeExtension<AppTextStyle>? other, double t) {
    if (other is! AppTextStyle) {
      return this;
    }
    return AppTextStyle(
      s16w400: TextStyle.lerp(s16w400, other.s16w400, t)!,
      // body2: TextStyle.lerp(body2, other.body2, t)!,
      // body3: TextStyle.lerp(body3, other.body3, t)!,
      // body4: TextStyle.lerp(body4, other.body4, t)!,
      // body5: TextStyle.lerp(body5, other.body5, t)!,
      // button1: TextStyle.lerp(button1, other.button1, t)!,
      // button2: TextStyle.lerp(button2, other.button2, t)!,
      // button3: TextStyle.lerp(button3, other.button3, t)!,
      // button4: TextStyle.lerp(button4, other.button4, t)!,
      // title1: TextStyle.lerp(title1, other.title1, t)!,
      // title2: TextStyle.lerp(title2, other.title2, t)!,
      // title3: TextStyle.lerp(title3, other.title3, t)!,
      // title4: TextStyle.lerp(title4, other.title4, t)!,
      // title5: TextStyle.lerp(title5, other.title5, t)!,
      // subTitle1: TextStyle.lerp(subTitle1, other.subTitle1, t)!,
      // subTitle2: TextStyle.lerp(subTitle2, other.subTitle2, t)!,
      // subTitle3: TextStyle.lerp(subTitle3, other.subTitle3, t)!,
      // subTitle4: TextStyle.lerp(subTitle4, other.subTitle4, t)!,
    );
  }
}
