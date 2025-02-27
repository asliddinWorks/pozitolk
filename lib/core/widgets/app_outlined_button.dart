// The outlined button for the application.

import 'package:flutter/material.dart';
import '/core/extension/widget_extension.dart';
import '/core/extension/context_extension.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({super.key,
    this.elevation = 7,
    this.height = 50,
    this.width,
    required this.onPressed,
    required this.text,
    this.appButtonType = AppButtonType.filled,
    this.textColor,
    this.fillTextStyle,
    this.outlinedTextStyle,
    this.color,
  });

  final double elevation;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final String text;
  final AppButtonType appButtonType;
  final Color? textColor;
  final TextStyle? fillTextStyle;
  final TextStyle? outlinedTextStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppButtonType.filled == appButtonType ?
    MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: onPressed,
      highlightElevation: 0,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(6),
      ),
      color: color ?? context.color.primaryVar2,
      minWidth: width,
      height: height,
      child: FittedBox(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: fillTextStyle ?? context.textStyle.s16w400.copyWith(
            color: textColor ?? context.color.primary,
          ),
        ).padding(EdgeInsets.all(7)),
      ),
    ) :
    MaterialButton(
      onPressed: onPressed,
      highlightElevation: 0,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: context.colorScheme.primary,
        ),
      ),
      minWidth: width,
      height: height,
      color: color ?? context.color.background1,
      child: Text(
        text,
        textAlign: TextAlign.center,
        // style: outlinedTextStyle ?? context.textStyle.button1.copyWith(
        //   color: textColor ?? context.colorScheme.primary,
        // ),
      ),
    );
  }
}

enum AppButtonType { filled, outlined }
