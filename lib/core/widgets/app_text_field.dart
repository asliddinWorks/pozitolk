// The main text field for the application. This widget is used for the Text field in the application.

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '/core/extension/context_extension.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.spaceBetweenTitleAndField = 5,
    this.padding = EdgeInsets.zero,
    this.hintStyle,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
    this.mask,
    this.obscureText,
    this.validator,
    this.readOnly,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;
  final double spaceBetweenTitleAndField;
  final EdgeInsets padding;
  final TextStyle? hintStyle;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? mask;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        readOnly: readOnly ?? false,
        obscureText: obscureText ?? false,
        obscuringCharacter: "*",
        onChanged: onChanged,
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: validator,
        inputFormatters: [
          MaskTextInputFormatter(
            mask: mask,
            filter: { "#": RegExp(r'[0-9]'), "*" : RegExp(r'[a-zA-Z0-9]') },
            // filter: { "#": RegExp(r'[0-9]') },
            // type: MaskAutoCompletionType.lazy,
          ),
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 16),
          hintText: hintText,
          hintStyle: hintStyle,
          errorMaxLines: 4,
        ),
        // style: context.textStyle.body2.copyWith(
        //   color: context.colorScheme.primary,
        // ),
      ),
    );
  }
}
