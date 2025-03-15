// The main button for the application. This widget is used for the Button in the application.

import 'package:flutter/material.dart';
import '/core/extension/context_extension.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key,
    this.elevation = 0,
    this.height = 45,
    this.width,
    required this.onPressed,
    required this.text,
    this.appButtonType = AppButtonType.filled,
    this.textColor,
    this.fillTextStyle,
    this.outlinedTextStyle,
    this.color,
    this.borderRadius,
    this.contentPadding,
  });

  final double elevation;                   // button shadow
  final double? height;                     // button height
  final double? width;                      // button width
  final void Function()? onPressed;         // button action
  final String text;                        // button text
  final AppButtonType appButtonType;        // button type (filled or outlined)
  final Color? textColor;                   // button text color
  final TextStyle? fillTextStyle;           // button fill text style
  final TextStyle? outlinedTextStyle;       // button outline text style
  final Color? color;                       // button color
  final BorderRadiusGeometry? borderRadius; // button border radius
  final EdgeInsets? contentPadding;         // button content padding

  @override
  Widget build(BuildContext context) {
    return AppButtonType.filled == appButtonType ?
    SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        highlightElevation: 0,
        elevation: elevation,
        padding: contentPadding == null ? null : EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
        color: color ?? context.colorScheme.primary,
        height: contentPadding == null ? height : 0,
        minWidth: width,
        child: Padding(
          padding: contentPadding ?? EdgeInsets.zero,
          child: FittedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: fillTextStyle ?? context.textStyle.s20w600inter.copyWith(
                color: textColor ?? context.color.background2,
              ),
            ),
          ),
        ),
      ),
    ) :
    SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        highlightElevation: 0,
        padding: contentPadding == null ? null : EdgeInsets.zero,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          side: BorderSide(
            width: 1,
            color: context.colorScheme.primary,
          ),
        ),
        minWidth: width,
        height: height,
        color: color ?? context.color.background1,
        child: FittedBox(
          child: Padding(
            padding: contentPadding ?? EdgeInsets.zero,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: outlinedTextStyle ?? context.textStyle.s20w400inter.copyWith(
                fontWeight: FontWeight.w500,
                color: textColor ?? context.color.text.withAlpha(200),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum AppButtonType { filled, outlined }
