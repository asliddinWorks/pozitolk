
import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';

class DropDownWithTitle extends StatelessWidget {
  const DropDownWithTitle({super.key,
    required this.title,
    this.titleStyle,
    this.style,
    this.padding = EdgeInsets.zero,
    this.contentPadding,
    this.spaceBetweenTitleAndButton = 5,
    required this.onChanged,
    this.onTap,
    required this.dropdownValue,
    this.borderRadius,
    required this.items,
    this.icon,
    this.hint,
  });

  final String title;
  final TextStyle? titleStyle;
  final TextStyle? style;
  final EdgeInsets padding;
  final EdgeInsets? contentPadding;
  final double spaceBetweenTitleAndButton;
  final void Function(dynamic value) onChanged;
  final Function()? onTap;
  final Object? dropdownValue;
  final BorderRadius? borderRadius;
  final List items;
  final Widget? icon;
  final String? hint;

  @override
  Widget build(BuildContext context) {

    Object value = dropdownValue!;
    if (!items.contains(dropdownValue)) {
      value = items.first;
    }

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle ?? context.textStyle.s16w500Manrope,),
          SizedBox(height: spaceBetweenTitleAndButton),

          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(5),
              color: context.color.base03,
            ),
            child: DropdownButton(
              hint: Text(hint ?? 'выбирать'),
              onChanged: onChanged,
              onTap: onTap,
              value: value,
              isExpanded: true,
              underline: const SizedBox.shrink(),
              borderRadius: borderRadius ?? BorderRadius.circular(5),
              padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
              icon: icon,
              style: style ?? context.textStyle.s16w500Manrope,
              // itemHeight: kMinInteractiveDimension + 30,
              itemHeight: null,
              items: items.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              },).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
