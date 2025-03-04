import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';

class FAQsItem extends StatelessWidget {
  const FAQsItem({super.key, required this.title, required this.text, required this.isOpen, required this.index});
  final String title;
  final String text;
  final bool isOpen;
  final int index;

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            read.onOpen(index);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.67.wp(context),
                child: Text(
                  title,
                  style: context.textStyle.s20w500inter,
                ),
              ),
              Icon(
                !isOpen
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up,
                size: 32,
              ),
            ],
          ),
        ),
        !isOpen ? 0.hGap : 16.hGap,
        !isOpen
            ? SizedBox.shrink()
            : Text(
          text,
          style: context.textStyle.s16w500inter
              .copyWith(color: context.color.textGrey2),
        ),
        index != read.faqTitle.length - 1 ? Divider(
          height: 40,
          color: context.color.dividerColor,
        ): SizedBox.shrink(),
        // 5.hGap
      ],
    );
  }
}
