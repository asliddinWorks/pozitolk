// import 'package:flutter/cupertino.dart';
// import 'package:pozitolk/core/extension/context_extension.dart';
// import 'package:pozitolk/core/extension/num_extension.dart';
//
// import '../../../../constants/app_images.dart';
//
// class AdvantagesItem extends StatelessWidget {
//   const AdvantagesItem({super.key, required this.text, required this.image});
//   final String text;
//   final String image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 390,
//       width: .7.wp(context),
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.5),
//         color: context.color.background1,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Image.asset(
//             image,
//             height: 75,
//             width: 75,
//           ),
//           20.hGap,
//           Expanded(
//             child: ListView(
//               children: [
//                 Text(
//                   text,
//                   textAlign: TextAlign.left,
//                   // maxLines: 3,
//                   // overflow: TextOverflow.ellipsis,
//                   style: context.textStyle.s14w400inter.copyWith(
//                     fontWeight: FontWeight.w500,
//                     color: context.color.textGrey2,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';

class AdvantagesItem extends StatelessWidget {
  const AdvantagesItem({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      width: .7.wp(context),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.5),
        color: context.color.background1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 75,
            width: 75,
          ),
          const SizedBox(height: 20),

          /// Matn uzunligini hisoblab, agar 8 qatordan ko‘p bo‘lsa, ListView ishlatamiz
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final textStyle = context.textStyle.s16w500inter.copyWith(
                  color: context.color.textGrey2,
                );

                /// Matn balandligini hisoblaymiz
                final textSpan = TextSpan(text: text, style: textStyle);
                final textPainter = TextPainter(
                  text: textSpan,
                  maxLines: null,
                  textDirection: TextDirection.ltr,
                );
                textPainter.layout(maxWidth: constraints.maxWidth);

                /// Har bir qatorning balandligini hisoblaymiz
                final lineHeight = textPainter.preferredLineHeight;
                final lineCount = (textPainter.height / lineHeight).ceil();

                /// Agar matn 8 qatordan ko‘p bo‘lsa, ListView bilan scroll qilamiz
                return lineCount > 7
                    ? ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Text(text, style: textStyle, textAlign: TextAlign.left,),
                  ],
                )
                    : Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(text, style: textStyle, textAlign: TextAlign.left,),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





