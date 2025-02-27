
import 'package:flutter/material.dart';
import '/core/extension/context_extension.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({super.key,
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
  });
  final TextStyle? style;
  final EdgeInsets padding;
  final EdgeInsets? contentPadding;
  final double spaceBetweenTitleAndButton;
  final void Function(dynamic value) onChanged;
  final Function()? onTap;
  final Object dropdownValue;
  final BorderRadius? borderRadius;
  final List items;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {

    Object value = dropdownValue;
    if (!items.contains(dropdownValue)) {
      value = items.first;
    }

    return Padding(
      padding: padding,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          color: context.color.background1,
          border: Border.all(
            width: 2,
            color: context.color.primaryVar2,
          ),
        ),
        child: DropdownButton(
          onChanged: onChanged,
          onTap: onTap,
          value: value,
          isExpanded: true,
          underline: const SizedBox.shrink(),
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 5),
          icon: icon,
          // style: context.textStyle.body2.copyWith(
          //   color: context.colorScheme.primary,
          // ),
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
    );
  }
}
