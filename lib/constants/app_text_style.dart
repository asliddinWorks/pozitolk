import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// custom text styles
class AppTextStyle extends ThemeExtension<AppTextStyle> {
  AppTextStyle({
    required this.s16w400,
    required this.s32w400,
    required this.s24w400,
    required this.s16w500inter,
    required this.s16w400inter,
    required this.s14w400inter,
    required this.s20w600inter,
    required this.s20w400inter,
    required this.s20w500inter
  });

  final TextStyle s16w400;
  final TextStyle s32w400;
  final TextStyle s24w400;
  final TextStyle s16w500inter;
  final TextStyle s16w400inter;
  final TextStyle s14w400inter;
  final TextStyle s20w600inter;
  final TextStyle s20w400inter;
  final TextStyle s20w500inter;

  /// new text styles

  static AppTextStyle light = AppTextStyle(
    s16w400: TextStyle(
      fontFamily: 'MV-Crooker',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.light.primary,
    ),
    s32w400: TextStyle(
      fontFamily: 'MV-Crooker',
      fontSize: 32,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: -0.6,
      color: AppColors.light.text,
    ),
    s24w400: TextStyle(
      fontFamily: 'MV-Crooker',
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColors.light.text,
      letterSpacing: 0.72,
      height: 1
    ),
    s16w500inter: GoogleFonts.inter(
      fontSize: 16,
      height: 1.56,
      fontWeight: FontWeight.w500,
      color: AppColors.light.text,
      letterSpacing: -0.32,
    ),
    s16w400inter: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.light.textGrey2,
      height: 1.25,
      letterSpacing: -0.32,
    ),
    s14w400inter: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.light.text,
      letterSpacing: -0.28,
    ),
    s20w600inter: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.light.text,
    ),
    s20w400inter: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.light.text,
      letterSpacing: -0.6,
    ),
    s20w500inter: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.light.text,
      letterSpacing: -0.6,
      height: 1.25
    ),
  );

  @override
  ThemeExtension<AppTextStyle> copyWith({
    TextStyle? s16w400,
    TextStyle? s32w400,
    TextStyle? s24w400,
    TextStyle? s16w500inter,
    TextStyle? s16w400inter,
    TextStyle? s14w400inter,
    TextStyle? s20w600inter,
    TextStyle? s20w400inter,
    TextStyle? s20w500inter,
  }) {
    return AppTextStyle(
      s16w400: s16w400 ?? this.s16w400,
      s32w400: s32w400 ?? this.s32w400,
      s24w400: s24w400 ?? this.s24w400,
      s16w500inter: s16w500inter ?? this.s16w500inter,
      s16w400inter: s16w400inter ?? this.s16w400inter,
      s14w400inter: s14w400inter ?? this.s14w400inter,
      s20w600inter: s20w600inter ?? this.s20w600inter,
      s20w400inter: s20w400inter ?? this.s20w400inter,
      s20w500inter: s20w500inter ?? this.s20w500inter
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
      s32w400: TextStyle.lerp(s32w400, other.s32w400, t)!,
      s24w400: TextStyle.lerp(s24w400, other.s24w400, t)!,
      s16w500inter: TextStyle.lerp(s16w500inter, other.s16w500inter, t)!,
      s16w400inter: TextStyle.lerp(s16w400inter, other.s16w400inter, t)!,
      s14w400inter: TextStyle.lerp(s14w400inter, other.s14w400inter, t)!,
      s20w600inter: TextStyle.lerp(s20w600inter, other.s20w600inter, t)!,
      s20w400inter: TextStyle.lerp(s20w400inter, other.s20w400inter, t)!,
      s20w500inter: TextStyle.lerp(s20w500inter, other.s20w500inter, t)!,
    );
  }
}
