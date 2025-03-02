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

class CollaborateItem extends StatelessWidget {
  const CollaborateItem(
      {super.key,
      required this.text,
      required this.image,
      required this.title});
  final String title;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .7.wp(context),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: context.color.background1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.color.background2,
              borderRadius: BorderRadius.circular(25),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              image,
            ),
          ),
          4.hGap,
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.color.background2,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: context.textStyle.s16w500inter
                          .copyWith(fontSize: 20, height: 1.25),
                    ),
                    8.hGap,
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const RangeMaintainingScrollPhysics(),
                        child: Text(
                          text,
                          style: context.textStyle.s16w500inter.copyWith(color: context.color.textGrey2),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
