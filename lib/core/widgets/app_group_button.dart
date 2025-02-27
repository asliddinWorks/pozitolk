
import 'package:flutter/material.dart';
import '/core/extension/context_extension.dart';
import '/core/widgets/app_button.dart';

class AppGroupButtonBar extends StatelessWidget {
  const AppGroupButtonBar({
    super.key,
    required this.children,
    this.spaceBetweenItems,
    this.height,
    this.textStyle,
    required this.currentIndex,
    this.selectedColor,
    this.unSelectedColor,
    this.selectedTextStyle,
    this.unSelectedTextStyle,
    this.margin,
    this.borderRadius,
    this.isExpanded = false,
    required this.onTap,
  });

  final void Function(int index) onTap;

  final List<AppGroupButtonItem> children;
  final int currentIndex;
  final double? spaceBetweenItems;
  final double? height;
  final TextStyle? textStyle;

  final Color? selectedColor;
  final Color? unSelectedColor;

  final TextStyle? selectedTextStyle;
  final TextStyle? unSelectedTextStyle;

  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;

  final bool? isExpanded;

  // Map<int, AppGroupButtonItem> get aa => children.asMap();

  AppGroupButtonItem item(int index) => AppGroupButtonItem(
    index: index,
    onTap: (index) {
      onTap(index);
      children[index].onTap(index);
    },
    isSelected: currentIndex == index,
    text: children[index].text,
    textStyle: children[index].textStyle ?? textStyle,
    spaceBetweenItems: children[index].spaceBetweenItems ?? spaceBetweenItems,

    selectedColor: children[index].selectedColor ?? selectedColor,
    unSelectedColor: children[index].unSelectedColor ?? unSelectedColor,

    selectedTextStyle: children[index].selectedTextStyle ?? selectedTextStyle,
    unSelectedTextStyle: children[index].unSelectedTextStyle ?? unSelectedTextStyle,

    borderRadius: children[index].borderRadius ?? borderRadius,

  );

  @override
  Widget build(BuildContext context) => Container(
    margin: margin,
    height: height ?? 30,
    child: (isExpanded!) ?
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children.asMap().map<int, Widget>((index, value) => MapEntry(index, Expanded(
        child: item(index)
      ),),).values.toList(),
    ) :
    ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: children.length,
      itemBuilder: (context, index) => item(index),
    ),
  );
}


/// item of [AppGroupButtonBar]
class AppGroupButtonItem extends StatelessWidget {
  const AppGroupButtonItem({
    super.key,
    required this.text,
    this.spaceBetweenItems,
    this.textStyle,
    this.isSelected,
    required this.onTap,
    this.selectedColor,
    this.unSelectedColor,
    this.selectedTextStyle,
    this.unSelectedTextStyle,
    this.index,
    this.borderRadius,
  });

  final int? index;
  final void Function(int index) onTap;
  final String text;
  final bool? isSelected;
  final TextStyle? textStyle;
  final double? spaceBetweenItems;

  final Color? selectedColor;
  final Color? unSelectedColor;

  final TextStyle? selectedTextStyle;
  final TextStyle? unSelectedTextStyle;

  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: spaceBetweenItems ?? 0),
    child:
    AppButton(
      onPressed: () => onTap(index!),
      elevation: 0,
      color: isSelected! ?
      selectedColor ?? context.color.primary :
      unSelectedColor ?? Colors.grey.shade400,
      appButtonType: isSelected! ? AppButtonType.filled : AppButtonType.outlined,
      borderRadius: borderRadius ?? BorderRadius.circular(50),
      height: 60,
      width: double.minPositive,
      text: text,
      fillTextStyle: selectedTextStyle,
      outlinedTextStyle: unSelectedTextStyle,
      // child: Text(text,
      //   textAlign: TextAlign.center,
      //   style: (textStyle != null) ? textStyle :
      //   (isSelected!) ?
      //   selectedTextStyle ?? const TextStyle() :
      //   unSelectedTextStyle ?? const TextStyle(),
      // ),
    ),
  );
}

