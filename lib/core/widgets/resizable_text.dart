import 'package:flutter/material.dart';

class ResizableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? height;

  const ResizableText({super.key, required this.text, this.style, this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = 100; // Boshlang‘ich katta shrift
        final textStyle = style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize);
        final textSpan = TextSpan(text: text, style: textStyle);

        final textPainter = TextPainter(
          text: textSpan,
          maxLines: 7,
          textDirection: TextDirection.ltr,
        );

        // Matn sig‘ishini tekshirish
        while (fontSize > 10) {
          textPainter.text = TextSpan(
            text: text,
            style: style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize),
          );
          textPainter.layout(maxWidth: constraints.maxWidth);

          if (textPainter.height > 120) {
            fontSize -= 3; // Matn sig‘maganda shriftni kichraytirish
          } else {
            break;
          }
        }

        return Container(
          height: height ?? 120,
          width: constraints.maxWidth,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize),
            textAlign: TextAlign.center,
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
