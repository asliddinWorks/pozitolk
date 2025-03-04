// import 'package:flutter/material.dart';
// import 'package:pozitolk/core/extension/context_extension.dart';
// import 'package:provider/provider.dart';
//
// import '../../view_model/home_view_model.dart';
//
// class FAQsUi extends StatelessWidget {
//   const FAQsUi({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<HomeViewModel>();
//     final watch = context.watch<HomeViewModel>();
//     return Container(
//       // height: 500,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: context.color.background1,
//       ),
//       margin: EdgeInsets.all(20),
//       child: ListView.separated(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         padding: EdgeInsets.all(8),
//         itemCount: read.faqData.length,
//         separatorBuilder: (context, index) => Divider(
//           thickness: 2, // Divider qalinligi
//           height: 10,   // Divider va element orasidagi masofa
//           color: Colors.grey.shade400, // Divider rangi
//         ),
//         itemBuilder: (context, index) {
//           return Theme(
//             data: Theme.of(context).copyWith(dividerColor: Colors.transparent), // Ichki dividerlarni olib tashlash
//             child: ExpansionTile(
//               key: Key(index.toString()), // To‘g‘ri ishlashi uchun har bir elementning unique kaliti
//               initiallyExpanded: watch.expandedIndex == index, // Faqat bitta ochiq bo‘lishi uchun tekshiruv
//               onExpansionChanged: (isOpen) => watch.onExpanded(isOpen, index), // Funksiya chaqirilishi
//               title: Text(watch.faqData[index]['question']!),
//               trailing: Icon(
//                 watch.expandedIndex == index ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//                 size: 32, // Icon kattaligi
//                 color: Colors.blue, // Icon rangi
//               ),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(watch.faqData[index]['answer']!),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       // child: SingleChildScrollView(
//       //   child: ExpansionPanelList.radio(
//       //     expandedHeaderPadding: EdgeInsets.zero,
//       //     elevation: 1,
//       //     dividerColor: Colors.grey.shade300,
//       //     children: [
//       //       _buildPanel(
//       //           context,
//       //           0,
//       //           'В чём разница между психологом,психотерапевом и психиатром?',
//       //           'Ответ: Работа с психологом возможна с 18 лет.'),
//       //       _buildPanel(
//       //         context,
//       //         1,
//       //         'Забыл заранее перенести сессию. Что делать?',
//       //         'Ответ: Свяжитесь с поддержкой как можно скорее.',
//       //       ),
//       //       _buildPanel(
//       //         context,
//       //         2,
//       //         'Как выбрать психолога, который подойдет?',
//       //         'Ответ: Ознакомьтесь с профилями специалистов и отзывами.',
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
//
//   ExpansionPanelRadio _buildPanel(
//       BuildContext context, int index, String title, String content) {
//     return ExpansionPanelRadio(
//       value: index,
//       headerBuilder: (context, isExpanded) {
//         return ListTile(
//           title: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(title, style: context.textStyle.s20w500inter),
//           ),
//         );
//       },
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text(content,
//             style: context.textStyle.s16w500inter
//                 .copyWith(color: context.color.textGrey2)),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/pages/home/pages/items/faqs_item.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';

class FAQsUi extends StatelessWidget {
  const FAQsUi({super.key});
  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeViewModel>();
    final watch = context.watch<HomeViewModel>();
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(left: 20, right: 10, top: 18, bottom: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.color.background1,
      ),
      child: ListView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: read.faqTitle.length,
          itemBuilder: (context, index) {
        return FAQsItem(
          isOpen: watch.isOpen[index],
          title: read.faqTitle[index],
          text: read.faqText[index],
          index: index,
        );
      }),
      // child: Column(
      //   children: [
      //     FaqsItem(
      //       title: 'В чём разница между психологом, психотерапевом и психиатром?',
      //       text: 'Психиатр имеет медицинское образование и может прописывать лекарства. Психолог — человек, '
      //       'у которого есть высшее психологическое образование или диплом о переквалификации. '
      //       'Если опираться строго на российское законодательство, то психотерапевт — это врач, который имеет '
      //       'психотерапевтическую специализацию. Однако мы и многие наши коллеги используем слова «психолог» и «психотерапевт» '
      //       'как синонимы, подразумевая под ними немедицинских специалистов, которые получили высшее психологическое + дополнительное '
      //       'образование в одном из психотерапевтических направлений (психоанализ, когнитивно-поведенческая терапия, '
      //       'гештальт-терапия и так далее).',
      //     ),
      //     FaqsItem(
      //       title: 'Я могу доверять Вашим психологам?',
      //       text: '',
      //     ),
      //     FaqsItem(
      //       title: 'психологам?',
      //       text: '',
      //     ),
      //     FaqsItem(
      //       title: 'психологам?',
      //       text: '',
      //     ),
      //     FaqsItem(
      //       title: 'психологам?',
      //       text: '',
      //     ),
      //     FaqsItem(
      //       title: 'психологам?',
      //       text: '',
      //     ),
      //     FaqsItem(
      //       title: 'психологам?',
      //       text: '',
      //     ),
      //     FaqsItem(
      //       title: 'психологам?',
      //       text: '',
      //     ),
      //     FaqsItem(
      //       title: 'психологам?',
      //       text: '',
      //     ),
      //     FaqsItem(
      //       title: 'психологам?',
      //       text: '',
      //     ),
      //   ],
      // ),


      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     SizedBox(
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           SizedBox(
      //             width: 0.67.wp(context),
      //             child: Padding(
      //               padding: const EdgeInsets.only(top: 10),
      //               child: Text(
      //                 'vfdsbf dbgfs'
      //                     'tgrshtr '
      //                     'shs rns '
      //                     'grqgr '
      //                     'tstwtwhtwbtrwb ',
      //
      //                 style: context.textStyle.s20w500inter,
      //               ),
      //             ),
      //           ),
      //           IconButton(
      //             onPressed: () {
      //               watch.onExpand();
      //             },
      //             icon: Icon(
      //               watch.isExpanded
      //                   ? Icons.keyboard_arrow_down
      //                   : Icons.keyboard_arrow_up,
      //               size: 32,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     16.hGap,
      //     watch.isExpanded
      //         ? SizedBox.shrink()
      //         : Text(
      //             'bvhggtuyx ffr fr fw fwf faf rqf rf rq 2 gtrwg gwg reg ',
      //             style: context.textStyle.s16w500inter
      //                 .copyWith(color: context.color.textGrey2),
      //           ),
      //   ],
      // ),
    );
  }
}
