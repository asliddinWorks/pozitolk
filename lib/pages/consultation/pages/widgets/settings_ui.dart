import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/constants/app_images.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/utils/calendar_day.dart';
import 'package:pozitolk/core/widgets/app_button.dart';
import 'package:pozitolk/core/widgets/app_text_field2.dart';
import 'package:pozitolk/core/widgets/drop_down_with_title.dart';
import 'package:pozitolk/core/widgets/text_field_with_title.dart';
import 'package:provider/provider.dart';
import '../../view_model/consultation_view_model.dart';

class SettingsUi extends StatelessWidget {
  const SettingsUi({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ConsultationViewModel>();
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.color.background2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.hGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Настройки',
                  style: context.textStyle.s22w600Manrope.copyWith(fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: context.color.primary,
                      borderRadius: BorderRadius.circular(16)),
                  child: SvgPicture.asset(AppIcons.icExit),
                )
              ],
            ),
            24.hGap,
            Container(
              padding: EdgeInsets.all(8),
              height: 82,
              decoration: BoxDecoration(
                color: context.color.base03,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Image(
                      image: AssetImage(AppImages.defaultImage),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Заменить',
                      style: context.textStyle.s14w400Manrope.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.color.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            24.hGap,
            TextFieldWithTitle(
              title: 'Имя/Псевдоним',
            ),
            24.hGap,
            AppTextField2(
              readOnly: true,
              controller: read.dateController,
              title: 'Дата и время  выезда',
              icon: IconButton(
                  onPressed: () {
                    selectDate(context, read.dateController);
                  },
                  icon: SvgPicture.asset(AppIcons.icCalendar)),
            ),
            16.hGap,
            DropDownWithTitle(
              icon: Icon(
                CupertinoIcons.chevron_down,
                size: 16,
                color: context.color.text,
              ),
              title: 'Часовой пояс',
              onChanged: (_) {},
              dropdownValue: '',
              items: ['МСК (+3 GMT)'],
            ),
            16.hGap,
            TextFieldWithTitle(
              title: 'Телефон',
              hintStyle: context.textStyle.s16w500Manrope,
              keyboardType: TextInputType.phone,
            ),
            6.hGap,
            RichText(
              textScaler: TextScaler.linear(1.2),
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Для смены номера напишите на электронную почту ',
                    style: context.textStyle.s14w400Manrope.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'pozitalk@mail.ru',
                    style: context.textStyle.s14w400Manrope.copyWith(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        color: context.color.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // launchUrlString(
                        //     'https://xn--g1acgdmcd1a.xn--p1ai/docs/pol-conf.pdf');
                      },
                  ),
                ],
              ),
            ),
            16.hGap,
            TextFieldWithTitle(
              title: 'Электроная почта',
              hintStyle: context.textStyle.s16w500Manrope,
              keyboardType: TextInputType.emailAddress,
            ),
            16.hGap,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Transform.scale(
                    scale: 1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Checkbox(
                        onChanged: (value) {
                          read.isChecked1 = value ?? false;
                          read.onSetState();
                        },
                        value: read.isChecked1,
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(color: Colors.grey),
                        fillColor: WidgetStatePropertyAll(read.isChecked1
                            ? context.colorScheme.primary
                            : context.color.base03),
                        focusColor: context.colorScheme.primary,
                        visualDensity: VisualDensity.comfortable,
                      ),
                    ),
                  ),
                ),
                10.wGap,
                SizedBox(
                  width: .8.wp(context),
                  child: Text(
                    'Новости и важные события встречи',
                    style: context.textStyle.s16w500Manrope,
                  ),
                ),
              ],
            ),
            16.hGap,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Transform.scale(
                    scale: 1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Checkbox(
                        onChanged: (value) {
                          read.isChecked2 = value ?? false;
                          read.onSetState();
                        },
                        value: read.isChecked2,
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(color: Colors.grey),
                        fillColor: WidgetStatePropertyAll(read.isChecked2
                            ? context.colorScheme.primary
                            : context.color.base03),
                        focusColor: context.colorScheme.primary,
                        visualDensity: VisualDensity.comfortable,
                      ),
                    ),
                  ),
                ),
                10.wGap,
                SizedBox(
                  width: .8.wp(context),
                  child: Text(
                    'Напоминание по почте за 24 часа до встречи',
                    style: context.textStyle.s16w500Manrope,
                  ),
                ),
              ],
            ),
            16.hGap,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Transform.scale(
                    scale: 1.5,
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: Checkbox(
                        onChanged: (value) {
                          read.isChecked3 = value ?? false;
                          read.onSetState();
                        },
                        value: read.isChecked3,
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(color: Colors.grey),
                        fillColor: WidgetStatePropertyAll(read.isChecked3
                            ? context.colorScheme.primary
                            : context.color.base03),
                        focusColor: context.colorScheme.primary,
                        visualDensity: VisualDensity.comfortable,
                      ),
                    ),
                  ),
                ),
                10.wGap,
                SizedBox(
                  width: .8.wp(context),
                  child: Text(
                    'Уведомления о сообщениях от терапевта',
                    style: context.textStyle.s16w500Manrope,
                  ),
                ),
              ],
            ),
            24.hGap,
            AppButton(
              contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              height: 45,
              width: .35.wp(context),
              borderRadius: BorderRadius.circular(16),
              onPressed: () {},
              text: 'Сохранить',
              color: context.color.primary,
            ),
            50.hGap
          ],
        ),
      ),
    );
  }
}
