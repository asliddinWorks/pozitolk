import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';

class CustomBulletList extends StatelessWidget {
  final List<String> items;

  const CustomBulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '• ',
                style: TextStyle(fontSize: 20, height: 1.1),
              ),
              Expanded(
                child: Text(
                  item,
                  style: context.textStyle.s16w500Manrope,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
