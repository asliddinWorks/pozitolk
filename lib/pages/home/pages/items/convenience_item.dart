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

class ConvenienceItem extends StatelessWidget {
  const ConvenienceItem(
      {super.key,
      required this.text, this.image, required this.title,
      required this.number, this.imageBottom, this.padding});
  final String text;
  final String? image;
  final String title;
  final num number;
  final String? imageBottom;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: .7.wp(context),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.5),
            color: context.color.background1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                number.toString(),
                style: context.textStyle.s32w400.copyWith(
                  fontSize: 80,
                  color: context.color.primary,
                ),
              ),
              27.hGap,
              Expanded(
                child: ListView(
                  physics: RangeMaintainingScrollPhysics(),
                  children: [
                    Text(
                      title,
                      style: context.textStyle.s16w500inter
                          .copyWith(fontSize: 20, height: 1.25),
                    ),
                    8.hGap,
                    Text(
                      text,
                      style: context.textStyle.s16w500inter
                          .copyWith(color: context.color.textGrey2),
                    ),
                    imageBottom != null ? 12.hGap : const SizedBox.shrink(),
                    imageBottom != null
                        ? Image.asset(
                            imageBottom ?? '',
                            height: 21,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
        image != null ? Positioned(
          top: 0,
          right: 0,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.5),
              )
              // borderRadius: BorderRadius.circular(15.5),
            ),
            child: Padding(
              padding: padding ?? const EdgeInsets.all(0),
              child: Image.asset(
                alignment: Alignment.topRight,
                image ?? '',
                height: 200,
                width: 180,
              ),
            ),
          ),
        ) : const SizedBox.shrink(),
      ],
    );
  }
}
