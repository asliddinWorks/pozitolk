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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/core/widgets/app_button.dart';
import 'package:pozitolk/pages/consultation/pages/items/consultation_help_item.dart';
import 'package:pozitolk/pages/consultation/view_model/consultation_view_model.dart';
import 'package:provider/provider.dart';

class ConsultationHelpUi extends StatelessWidget {
  const ConsultationHelpUi({super.key});
  @override
  Widget build(BuildContext context) {
    final read = context.read<ConsultationViewModel>();
    final watch = context.watch<ConsultationViewModel>();
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  width: 78,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.color.secondary200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(AppIcons.icDecoration),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  width: 78,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.color.secondary200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(AppIcons.icDecoration),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  width: 78,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.color.secondary200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(AppIcons.icDecoration),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  width: 78,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.color.secondary200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(AppIcons.icDecoration),
                ),
              ],
            ).padding(EdgeInsets.all(16)),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.color.background2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: read.faqTitle.length,
                itemBuilder: (context, index) {
                  return ConsultationHelpItem(
                    isOpen: watch.isOpen[index],
                    title: read.faqTitle[index],
                    text: read.faqText[index],
                    index: index,
                  );
                },
              ),
            ),
            10.hGap,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.color.background2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Не нашли ответ на свой вопрос?',
                    style:
                        context.textStyle.s22w600Manrope.copyWith(fontSize: 20),
                  ),
                  8.hGap,
                  Text(
                    'Напишите нам, мы поможем разобраться',
                    style: context.textStyle.s14w400Manrope,
                  ),
                  22.hGap,
                  AppButton(
                    color: context.color.secondary200,
                    fillTextStyle: context.textStyle.s16w600Manrope.copyWith(
                      color: context.color.background2,
                      fontWeight: FontWeight.w500,
                    ),
                    width: double.infinity,
                    height: 56,
                    onPressed: () {},
                    text: 'Написать в тех.поддержку',
                  ),
                  22.hGap,
                  Text(
                    'Есть вопросы о работе вашего специалиста?',
                    style:
                        context.textStyle.s22w600Manrope.copyWith(fontSize: 20),
                  ),
                  8.hGap,
                  Text(
                    'Напишите нам, мы поможем разобраться',
                    style: context.textStyle.s14w400Manrope,
                  ),
                  22.hGap,
                  AppButton(
                    color: context.color.secondary200,
                    fillTextStyle: context.textStyle.s16w600Manrope.copyWith(
                      color: context.color.background2,
                      fontWeight: FontWeight.w500,
                    ),
                    width: double.infinity,
                    height: 56,
                    onPressed: () {},
                    text: 'Написать куратору',
                  ),
                  22.hGap,
                  Wrap(
                    children: [
                      Text(
                        'Электронная почта - ',
                        style: context.textStyle.s16w600Manrope
                            .copyWith(color: context.color.text),
                      ),
                      GestureDetector(
                        onTap: (){
                          // launchUrlString('help@pozitalk.ru');
                        },
                        child: Text(
                          'help@pozitalk.ru',
                          style: context.textStyle.s16w600Manrope
                              .copyWith(color: context.color.primary),
                        ),
                      ),
                    ],
                  ),
                  100.hGap
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
