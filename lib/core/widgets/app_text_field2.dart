
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pozitolk/core/extension/context_extension.dart';

class AppTextField2 extends StatelessWidget {
  const AppTextField2({super.key,
    this.controller,
    this.onChanged,
    this.title,
    this.hintText,
    this.spaceBetweenTitleAndField = 5,
    this.padding = EdgeInsets.zero,
    this.titleStyle,
    this.hintStyle,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
    this.mask,
    this.readOnly = false, this.onTap,
    this.icon,
    this.text,
    this.height,
    this.inputFormatters,
    this.maxLength,
    this.fillColor
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? title;
  final String? hintText;
  final double spaceBetweenTitleAndField;
  final EdgeInsets padding;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? mask;
  final bool readOnly;
  final void Function()? onTap;
  final Widget? icon;
  final String? text;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Color? fillColor;


  @override
  Widget build(BuildContext context) {
    // final FocusNode _focusNode = FocusNode();
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(title!, style: titleStyle ?? context.textStyle.s16w500Manrope,
            ),
          ),
          if (title != null)
          const SizedBox(height: 8),

          SizedBox(
            height: height ?? 48,
            child: TextField(
              style: context.textStyle.s16w500Manrope,
              // focusNode: _focusNode,
              // textInputAction: TextInputAction.done,
              // onSubmitted: (value) {_focusNode.unfocus(); // Done bosilganda klaviaturani yopish
              // },
              // onEditingComplete: () {
              //   FocusScope.of(context).unfocus(); // Fokusni olib tashlash orqali klaviaturani yopish
              // },
              onTap: onTap,
              onChanged: onChanged,
              controller: controller,
              minLines: minLines,
              maxLines: maxLines,
              keyboardType: keyboardType,
              readOnly: readOnly,
              maxLength: maxLength,
              // maxLengthEnforcement: MaxLengthEnforcement.none,
              inputFormatters: inputFormatters ?? [
                MaskTextInputFormatter(
                  mask: mask,
                  filter: { "#": RegExp(r'[0-9]'), "*" : RegExp(r'[a-zA-Z0-9]') },
                  // filter: { "#": RegExp(r'[0-9]') },
                  // type: MaskAutoCompletionType.lazy,
                ),
              ],
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                counterText: "",
                suffixText: text,
                suffixStyle: context.textStyle.s14w400Manrope.copyWith(color: context.color.text),
                suffixIcon: icon,
                // suffixIcon: icon,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ) ,
                focusedBorder: OutlineInputBorder(
                  borderSide:  BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: fillColor ?? context.color.base03,
                hintText: hintText,
                hintStyle: hintStyle,
              ),

            ),
          ),
        ],
      ),
    );
  }
}
