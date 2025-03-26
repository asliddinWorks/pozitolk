
import 'package:flutter/material.dart';

/// standard colors
const colorLightScheme = ColorScheme.light(
  primary: Color(0xFFFF6900),
  secondary: Color(0xffFAAB19),
  surface: Color(0xFFFFFFFF),
  // surface: Color(0xFF000000),
  // onSurface: Color(0xFFEBEFF2),
  onSurface: Colors.black,
  error: Color(0xFFEB4335),
);

/// custom colors
class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    required this.primary,
    required this.primaryVar1,
    required this.primaryVar2,
    required this.background1,
    required this.background2,
    required this.containerBackground,
    required this.containerBackground2,
    required this.containerBackgroundF3,
    required this.containerBackgroundF4,
    required this.containerGreen,
    required this.secondary,
    required this.secondary200,
    required this.secondaryVar2,
    required this.googlePart,
    required this.iconColorGrey,
    required this.text,
    required this.textGrey,
    required this.textGrey2,
    required this.textGrey3,
    required this.dividerColor,
    required this.facebook,
    required this.twitter,
    required this.accent1,
    required this.activeChat,
    required this.error,
    required this.warningAlert,
    required this.inactiveFBA,
    required this.textA4,
    required this.textBA,
    required this.base03,
  });

  final Color primary;
  final Color primaryVar1;
  final Color primaryVar2;
  final Color background1;
  final Color background2;
  final Color containerBackground;
  final Color containerBackground2;
  final Color containerBackgroundF3;
  final Color containerBackgroundF4;
  final Color containerGreen;
  final Color secondary;
  final Color secondary200;
  final Color secondaryVar2;
  final Color googlePart;
  final Color iconColorGrey;
  final Color text;
  final Color textGrey;
  final Color textGrey2;
  final Color textGrey3;
  final Color dividerColor;
  final Color facebook;
  final Color twitter;
  final Color accent1;
  final Color activeChat;
  final Color error;
  final Color warningAlert;
  final Color inactiveFBA;
  final Color textA4;
  final Color textBA;
  final Color base03;


  static AppColors light = AppColors(
    primary: const Color(0xFFFB812C),
    primaryVar1: const Color(0x80044F73),
    primaryVar2: const Color(0x66044F73),
    background1: const Color(0xffF7F7F7),
    background2: const Color(0xFFFFFFFF),
    containerBackground: const Color(0xFFEEEEEE),
    containerBackground2: const Color(0xFFF2F2F2),
    containerBackgroundF3: const Color(0xFFF3F3F3),
    containerBackgroundF4: const Color(0xFFF4F4F4),
    containerGreen: const Color(0xFF2E4F24),
    secondary: const Color(0xFFFAAB1A),
    secondary200: const Color(0xFFABD29B),
    secondaryVar2: const Color(0x4DFFAB11),
    googlePart: const Color(0xFF4285F4),
    iconColorGrey: const Color(0xFFDDDDDD),
    text: const Color(0xFF191919),
    textGrey: const Color(0xFF666666),
    textGrey2: const Color(0xFF4D4D4D),
    textGrey3: const Color(0xFFA49C98),
    textA4: const Color(0xFFA4A4A4),
    textBA: const Color(0xFFA4A4A4),
    dividerColor: const Color(0xFFDCDCDC),
    facebook: const Color(0xFF1877F2),
    twitter: const Color(0xFF55ACEE),
    accent1: const Color(0xFFC4C4C4),
    activeChat: const Color(0xFF219653),
    error: const Color(0xFFEB4335),
    warningAlert: const Color(0xFFFF0000),
    inactiveFBA: const Color(0x4DFFAB11),
    base03: const Color(0xFFF6F7F4),
  );

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? primaryVar1,
    Color? primaryVar2,
    Color? background1,
    Color? background2,
    Color? containerBackground,
    Color? containerBackground2,
    Color? containerBackgroundF3,
    Color? containerBackgroundF4,
    Color? containerGreen,
    Color? secondary,
    Color? secondary200,
    Color? secondaryVar2,
    Color? googlePart,
    Color? iconColorGrey,
    Color? text,
    Color? textGrey,
    Color? textGrey2,
    Color? textGrey3,
    Color? dividerColor,
    Color? facebook,
    Color? twitter,
    Color? accent1,
    Color? activeChat,
    Color? error,
    Color? warningAlert,
    Color? inactiveFBA,
    Color? textA4,
    Color? textBA,
    Color? base03,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      primaryVar1: primaryVar1 ?? this.primaryVar1,
      primaryVar2: primaryVar2 ?? this.primaryVar2,
      background1: background1 ?? this.background1,
      background2: background2 ?? this.background2,
      containerBackground: containerBackground ?? this.containerBackground,
      containerBackground2: containerBackground2 ?? this.containerBackground2,
      containerBackgroundF3: containerBackgroundF3 ?? this.containerBackgroundF3,
      containerBackgroundF4: containerBackgroundF4 ?? this.containerBackgroundF4,
      containerGreen: containerGreen ?? this.containerGreen,
      secondary: secondary ?? this.secondary,
      secondary200: secondary200 ?? this.secondary200,
      secondaryVar2: secondaryVar2 ?? this.secondaryVar2,
      googlePart: googlePart ?? this.googlePart,
      iconColorGrey: iconColorGrey ?? this.iconColorGrey,
      text: text ?? this.text,
      textGrey: textGrey ?? this.textGrey,
      textGrey2: textGrey2 ?? this.textGrey2,
      textGrey3: textGrey3 ?? this.textGrey3,
      dividerColor: dividerColor ?? this.dividerColor,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      accent1: accent1 ?? this.accent1,
      activeChat: activeChat ?? this.activeChat,
      error: error ?? this.error,
      warningAlert: warningAlert ?? this.warningAlert,
      inactiveFBA: inactiveFBA ?? this.inactiveFBA,
      textA4: textA4 ?? this.textA4,
      textBA: textBA ?? this.textBA,
      base03: base03 ?? this.base03,

    );
  }

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryVar1: Color.lerp(primaryVar1, other.primaryVar1, t)!,
      primaryVar2: Color.lerp(primaryVar2, other.primaryVar2, t)!,
      background1: Color.lerp(background1, other.background1, t)!,
      background2: Color.lerp(background2, other.background2, t)!,
      containerBackground: Color.lerp(containerBackground, other.containerBackground, t)!,
      containerBackground2: Color.lerp(containerBackground2, other.containerBackground2, t)!,
      containerBackgroundF3: Color.lerp(containerBackgroundF3, other.containerBackgroundF3, t)!,
      containerBackgroundF4: Color.lerp(containerBackgroundF4, other.containerBackgroundF4, t)!,
      containerGreen: Color.lerp(containerGreen, other.containerGreen, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondary200: Color.lerp(secondary200, other.secondary200, t)!,
      secondaryVar2: Color.lerp(secondaryVar2, other.secondaryVar2, t)!,
      googlePart: Color.lerp(googlePart, other.googlePart, t)!,
      iconColorGrey: Color.lerp(iconColorGrey, other.iconColorGrey, t)!,
      text: Color.lerp(text, other.text, t)!,
      textGrey: Color.lerp(textGrey, other.textGrey, t)!,
      textGrey2: Color.lerp(textGrey2, other.textGrey2, t)!,
      textGrey3: Color.lerp(textGrey3, other.textGrey3, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      facebook: Color.lerp(facebook, other.facebook, t)!,
      twitter: Color.lerp(twitter, other.twitter, t)!,
      accent1: Color.lerp(accent1, other.accent1, t)!,
      activeChat: Color.lerp(activeChat, other.activeChat, t)!,
      error: Color.lerp(error, other.error, t)!,
      warningAlert: Color.lerp(warningAlert, other.warningAlert, t)!,
      inactiveFBA: Color.lerp(inactiveFBA, other.inactiveFBA, t)!,
      textA4: Color.lerp(textA4, other.textA4, t)!,
      textBA: Color.lerp(textBA, other.textBA, t)!,
      base03: Color.lerp(base03, other.base03, t)!,
    );
  }
}
