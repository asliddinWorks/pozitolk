import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/core/widgets/app_button.dart';
import 'package:pozitolk/core/widgets/upload_image_square.dart';
import 'package:pozitolk/pages/consultation/view_model/consultation_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/calendar_day.dart';
import '../../../../core/widgets/app_text_field2.dart';
import '../../../../core/widgets/drop_down_with_title.dart';
import '../../../../core/widgets/text_field_with_title.dart';

class PsychologistSettingsUi extends StatelessWidget {
  const PsychologistSettingsUi({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ConsultationViewModel>();
    final watch = context.watch<ConsultationViewModel>();
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: context.color.background2,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.icSetting1,
                      height: 20,
                      width: 20,
                    ),
                    10.wGap,
                    Text(
                      'Прочитать этический кодекс',
                      style: context.textStyle.s16w500inter,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.color.background2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.hGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ваш личный профиль',
                    style:
                        context.textStyle.s22w600Manrope.copyWith(fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: (){
                      read.onExit(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: context.color.primary,
                          borderRadius: BorderRadius.circular(16)),
                      child: SvgPicture.asset(AppIcons.icExit),
                    ),
                  )
                ],
              ),
              12.hGap,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                read.onProfileItemSelected(0);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: watch.profileItem[0]
                                          ? context.color.primary
                                          : Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Личные данные',
                                  style:
                                      context.textStyle.s16w500Manrope.copyWith(
                                    color: watch.profileItem[0]
                                        ? context.color.primary
                                        : context.color.textGrey3,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                read.onProfileItemSelected(1);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: watch.profileItem[1]
                                          ? context.color.primary
                                          : Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Специализация',
                                  style:
                                      context.textStyle.s16w500Manrope.copyWith(
                                    color: watch.profileItem[1]
                                        ? context.color.primary
                                        : context.color.textGrey3,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        26.wGap,
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                read.onProfileItemSelected(2);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: watch.profileItem[2]
                                          ? context.color.primary
                                          : Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Контактные данные',
                                  style:
                                      context.textStyle.s16w500Manrope.copyWith(
                                    color: watch.profileItem[2]
                                        ? context.color.primary
                                        : context.color.textGrey3,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                read.onProfileItemSelected(3);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: watch.profileItem[3]
                                          ? context.color.primary
                                          : Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Образование',
                                  style:
                                      context.textStyle.s16w500Manrope.copyWith(
                                    color: watch.profileItem[3]
                                        ? context.color.primary
                                        : context.color.textGrey3,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        26.wGap,
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                read.onProfileItemSelected(4);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: watch.profileItem[4]
                                          ? context.color.primary
                                          : Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Клиенты',
                                  style:
                                      context.textStyle.s16w500Manrope.copyWith(
                                    color: watch.profileItem[4]
                                        ? context.color.primary
                                        : context.color.textGrey3,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                read.onProfileItemSelected(5);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: watch.profileItem[5]
                                          ? context.color.primary
                                          : Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Договор',
                                  style:
                                      context.textStyle.s16w500Manrope.copyWith(
                                    color: watch.profileItem[5]
                                        ? context.color.primary
                                        : context.color.textGrey3,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              watch.profileItem[0]
                  ? SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.hGap,
                          // Container(
                          //   padding: EdgeInsets.all(8),
                          //   height: 82,
                          //   decoration: BoxDecoration(
                          //     color: context.color.base03,
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Container(
                          //         clipBehavior: Clip.hardEdge,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(6),
                          //         ),
                          //         child: Image(
                          //           image: AssetImage(AppImages.defaultImage),
                          //         ),
                          //       ),
                          //       GestureDetector(
                          //         onTap: (){
                          //         },
                          //         child: Text(
                          //           'Заменить',
                          //           style: context.textStyle.s14w400Manrope
                          //               .copyWith(
                          //             fontWeight: FontWeight.w500,
                          //             color: context.color.primary,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          UploadImageSquare(image: watch.imageUrl,
                            onTap: (image) {
                              read.selectedImageFile = image;
                             read.onSetState();
                            },

                            imageFile: read.selectedImageFile,
                          ),
                          24.hGap,
                          TextFieldWithTitle(
                            controller: read.nameController,
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
                          24.hGap,

                          Text('Пол', style: context.textStyle.s16w500Manrope,),
                          5.hGap,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: context.color.base03,
                            ),
                            child: DropdownButton<String>(
                              icon: Icon(
                              CupertinoIcons.chevron_down,
                              size: 16,
                              color: context.color.text,
                            ),
                              underline: const SizedBox.shrink(),
                              borderRadius: BorderRadius.circular(5),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              style: context.textStyle.s16w500Manrope,
                              value: read.selectSex, // Agar `null` bo‘lsa, hint chiqadi
                              hint: Text("выбирать"), // Foydalanuvchi hali tanlamagan bo‘lsa, ko‘rinadi
                              isExpanded: true,
                              items: read.sexItem.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                read.selectSex = newValue;
                                read.onSetState();
                              },
                            ),
                          ),
                          24.hGap,
                          DropDownWithTitle(
                            icon: Icon(
                              CupertinoIcons.chevron_down,
                              size: 16,
                              color: context.color.text,
                            ),
                            title: 'Язык',
                            onChanged: (newValue) {
                              read.selectLanguage = newValue;
                              read.onSetState();
                            },
                            dropdownValue: watch.selectLanguage.toString(),
                            items: ['Русский', 'Английский'],
                          ),
                          24.hGap,
                          Text('О себе',
                              style: context.textStyle.s14w400Manrope),
                          24.hGap,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                                color: context.color.base03,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Lorem Ipsum - это текст-"рыба", часто используемый в печати и '
                              'вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для '
                              'текстов на латинице с начала XVI века. ',
                              style: context.textStyle.s14w400Manrope,
                            ),
                          ),
                          25.hGap,
                          AppButton(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 7),
                            width: double.infinity,
                            onPressed: () {
                              read.patchPersonalData(context);
                            },
                            text: 'Сохранить изменения',
                          ),
                          60.hGap,
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
              watch.profileItem[2]
                  ? SizedBox(
                      child: Column(
                        children: [
                          24.hGap,
                          TextFieldWithTitle(
                            controller: read.phoneController,
                            keyboardType: TextInputType.phone,
                            title: 'Телефон',
                          ),
                          24.hGap,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Transform.scale(
                                  scale: 1.2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Checkbox(
                                      onChanged: (value) {
                                        read.isChecked2 = value ?? false;
                                        read.onSetState();
                                      },
                                      value: read.isChecked2,
                                      // shape: RoundedRect2
                                      //ngleBorder(borderRadius: BorderRadius.circular(5)),
                                      side: BorderSide(color: Colors.grey),
                                      fillColor: WidgetStatePropertyAll(
                                          read.isChecked2
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
                                width: .75.wp(context),
                                child: Text(
                                  'Получать сообщения от клиентов на этот номер',
                                  style: context.textStyle.s14w500Manrope,
                                ),
                              ),
                            ],
                          ),
                          12.hGap,
                          RichText(
                            textScaler: TextScaler.linear(1.2),
                            text: TextSpan(children: [
                              TextSpan(
                                text:
                                    'Для смены номера напишите на электронную почту ',
                                style: context.textStyle.s14w500Manrope,
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: 'pozitalk@mail.ru',
                                style: context.textStyle.s14w500Manrope
                                    .copyWith(color: context.color.primary),
                              )
                            ]),
                          ),
                          24.hGap,
                          TextFieldWithTitle(
                            controller: read.emailController,
                            title: 'Электроная почта',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          24.hGap,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Transform.scale(
                                  scale: 1.2,
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
                                      fillColor: WidgetStatePropertyAll(
                                          read.isChecked3
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
                                width: .75.wp(context),
                                child: Text(
                                  'Получать сообщения от клиентов на эту почту',
                                  style: context.textStyle.s14w500Manrope,
                                ),
                              ),
                            ],
                          ),
                          24.hGap,
                          AppButton(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 7),
                            width: double.infinity,
                            onPressed: () {
                              read.patchContact(context);
                            },
                            text: 'Сохранить изменения',
                          ),
                          20.hGap
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
              watch.profileItem[1]
                  ? SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.hGap,
                          AppTextField2(
                            height: 140,
                            maxLines: 5,
                            title: 'Опишите методы работы',
                          ),
                          28.hGap,
                          Text(
                            'Возраст клиентов',
                            style: context.textStyle.s16w500Manrope,
                          ),
                          16.hGap,
                          Row(
                            children: [
                              AppButton(
                                height: 40,
                                width: 62,
                                borderRadius: BorderRadius.circular(24),
                                onPressed: () {},
                                text: '16+',
                              ),
                              12.wGap,
                              AppButton(
                                borderColor: context.color.background1,
                                appButtonType: AppButtonType.outlined,
                                height: 40,
                                width: 62,
                                borderRadius: BorderRadius.circular(24),
                                onPressed: () {},
                                text: '18+',
                              ),
                            ],
                          ),
                          16.hGap,
                          Text(
                            'Закон разрешает психологические консультации с 16 лет',
                            style: context.textStyle.s14w400Manrope
                                .copyWith(fontSize: 12),
                          ),
                          28.hGap,
                          Text(
                            'Опыт работы с поиском идентичности',
                            style: context.textStyle.s16w500Manrope,
                          ),
                          16.hGap,
                          Row(
                            children: [
                              AppButton(
                                contentPadding: EdgeInsets.all(8),
                                height: 40,
                                width: 62,
                                borderRadius: BorderRadius.circular(24),
                                onPressed: () {},
                                text: 'Да',
                              ),
                              12.wGap,
                              AppButton(
                                borderColor: context.color.background1,
                                appButtonType: AppButtonType.outlined,
                                height: 40,
                                width: 62,
                                borderRadius: BorderRadius.circular(24),
                                onPressed: () {},
                                text: 'Нет',
                              ),
                            ],
                          ),
                          16.hGap,
                          Text(
                            'Используем для ручного подбора по запросу клиентов со сложностью с самоидентификацией и поиском идентичности ',
                            style: context.textStyle.s14w400Manrope
                                .copyWith(fontSize: 12),
                          ),
                          28.hGap,
                          Text(
                            'Работа с парами',
                            style: context.textStyle.s16w500Manrope,
                          ),
                          16.hGap,
                          Row(
                            children: [
                              AppButton(
                                contentPadding: EdgeInsets.all(8),
                                height: 40,
                                width: 62,
                                borderRadius: BorderRadius.circular(24),
                                onPressed: () {},
                                text: 'Да',
                              ),
                              12.wGap,
                              AppButton(
                                borderColor: context.color.background1,
                                appButtonType: AppButtonType.outlined,
                                height: 40,
                                width: 62,
                                borderRadius: BorderRadius.circular(24),
                                onPressed: () {},
                                text: 'Нет',
                              ),
                            ],
                          ),
                          24.hGap,
                          AppButton(
                            borderColor: context.color.background1,
                            appButtonType: AppButtonType.outlined,
                            height: 40,
                            width: 105,
                            borderRadius: BorderRadius.circular(16),
                            onPressed: () {},
                            text: 'Добавить',
                          ),
                          24.hGap,
                          AppButton(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 7),
                            width: double.infinity,
                            onPressed: () {},
                            text: 'Сохранить изменения',
                          ),
                          20.hGap,
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
              watch.profileItem[3] ? SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.hGap,
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: read.educationPlaceController.length,
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 0.62.wp(context),
                            child: TextFieldWithTitle(
                              titleStyle: context.textStyle.s14w500Manrope,
                              controller: read.educationPlaceController[index],
                              title: 'Место получения',
                            ),
                          ),
                          SizedBox(
                            width: 0.25.wp(context),
                            child: TextFieldWithTitle(
                              titleStyle: context.textStyle.s14w500Manrope,
                              controller: read.educationYearController[index],
                              keyboardType: TextInputType.number,
                              mask: '####',
                              title: 'Год',
                            ),
                          ),
                        ],
                      ).padding(EdgeInsets.only(bottom: 20)),
                    ),
                    AppButton(
                      borderColor: context.color.background1,
                      appButtonType: AppButtonType.outlined,
                      height: 40,
                      width: 105,
                      borderRadius: BorderRadius.circular(16),
                      onPressed: () {
                        read.educationPlaceController.add(TextEditingController());
                        read.educationYearController.add(TextEditingController());
                        read.onSetState();
                      },
                      text: 'Добавить',
                    ),
                    24.hGap,
                    AppButton(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                      width: double.infinity,
                      onPressed: () {},
                      text: 'Сохранить изменения',
                    ),
                    20.hGap,
                  ],
                ),
              ) : SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
