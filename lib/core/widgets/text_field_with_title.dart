
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pozitolk/core/extension/context_extension.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({super.key,
    this.controller,
    this.onChanged,
    required this.title,
    this.hintText,
    this.spaceBetweenTitleAndField = 5,
    this.padding = EdgeInsets.zero,
    this.titleStyle,
    this.hintStyle,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
    this.mask,
    this.readOnly,

  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String title;
  final String? hintText;
  final double spaceBetweenTitleAndField;
  final EdgeInsets padding;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? mask;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle ?? context.textStyle.s16w500Manrope,),
          SizedBox(height: spaceBetweenTitleAndField),
          TextField(
            readOnly: readOnly ?? false,
            style: hintStyle ?? context.textStyle.s16w600Manrope,
            onChanged: onChanged,
            controller: controller,
            minLines: minLines,
            maxLines: maxLines,

            keyboardType: keyboardType,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: mask,
                filter: { "#": RegExp(r'[0-9]'), "*" : RegExp(r'[a-zA-Z0-9]') },
                // filter: { "#": RegExp(r'[0-9]') },
                // type: MaskAutoCompletionType.lazy,
              ),
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              filled: true, // Orqa fonni bo'yash uchun
              fillColor: context.color.base03, // Fonni rangini o'zgartirish
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), // Border radiusni 10 qilish
                borderSide: BorderSide.none, // Chegarani olib tashlash
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none, // Aktiv bo'lmaganda chegara
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none, // Fokuslanganda chegara
              ),
              hintText: hintText,
            ),

          ),
        ],
      ),
    );
  }
}
