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
import 'package:pozitolk/pages/consultation/view_model/chat_view_model.dart';
import 'package:pozitolk/pages/consultation/view_model/consultation_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/calendar_day.dart';
import '../../../../core/widgets/app_text_field2.dart';
import '../../../../core/widgets/drop_down_with_title.dart';
import '../../../../core/widgets/text_field_with_title.dart';

class PsychologistSettingsUi extends StatefulWidget {
  const PsychologistSettingsUi({super.key});

  @override
  State<PsychologistSettingsUi> createState() => _PsychologistSettingsUiState();
}

class _PsychologistSettingsUiState extends State<PsychologistSettingsUi> {
  late ConsultationViewModel read;
  late ChatViewModel readChat;
  @override
  void initState() {
    read = context.read<ConsultationViewModel>();
    readChat = context.read<ChatViewModel>();
    readChat.isMessageOpen = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      read.motionTabBarController?.index = 4;
      await Future.delayed(Duration(milliseconds: 400),);
      read.profileItem[0] = true;
      read.isShow = true;
      read.key.currentState!.closeEndDrawer();
      // read.onDrawerSelected(context, 7);
      read.onSetState();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final read = context.read<ConsultationViewModel>();
    final watch = context.watch<ConsultationViewModel>();
    return SingleChildScrollView(
      child: Column(
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
                      onTap: () {
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
                            UploadImageSquare(
                              image: watch.imageUrl,
                              onTap: (image) {
                                read.selectedImageFile = image;
                                read.onSetState();
                              },
                              imageFile: read.selectedImageFile,
                            ),
                            24.hGap,
                            // TextField(
                            //   controller: read.nameController,
                            // ),
                            watch.isShow ?
                            TextFieldWithTitle(
                              controller: read.nameController,
                              title: 'Имя/Псевдоним',
                            ): SizedBox.shrink(),
                            24.hGap,
                            watch.isShow ?
                            AppTextField2(
                              readOnly: true,
                              controller: read.dateController,
                              title: 'Дата рождения',
                              icon: IconButton(
                                  onPressed: () {
                                    selectDate(context, read.dateController);
                                  },
                                  icon: SvgPicture.asset(AppIcons.icCalendar)),
                            ): SizedBox.shrink(),
                            24.hGap,

                            Text(
                              'Пол',
                              style: context.textStyle.s16w500Manrope,
                            ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                style: context.textStyle.s16w500Manrope,
                                value: read
                                    .selectSex, // Agar `null` bo‘lsa, hint chiqadi
                                hint: Text(
                                    "выбирать"), // Foydalanuvchi hali tanlamagan bo‘lsa, ko‘rinadi
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
                            // 24.hGap,
                            // Text('О себе',
                            //     style: context.textStyle.s14w400Manrope),
                            24.hGap,
                            AppTextField2(
                              controller: read.descriptionController,
                              height: 140,
                              maxLines: 5,
                              title: 'О себе',
                            ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: 16, vertical: 12),
                            //   decoration: BoxDecoration(
                            //       color: context.color.base03,
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: Text(
                            //     'Lorem Ipsum - это текст-"рыба", часто используемый в печати и '
                            //     'вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для '
                            //     'текстов на латинице с начала XVI века. ',
                            //     style: context.textStyle.s14w400Manrope,
                            //   ),
                            // ),
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
                              readOnly: true,
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
                              controller: read.workingMethodController,
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
                                  borderColor: context.color.background1,
                                  appButtonType: watch.clientAge ? AppButtonType.outlined : AppButtonType.filled,
                                  height: 40,
                                  width: 62,
                                  borderRadius: BorderRadius.circular(24),
                                  onPressed: () {
                                    read.clientAge = !read.clientAge;
                                    read.onSetState();
                                  },
                                  text: '16+',
                                ),
                                12.wGap,
                                AppButton(
                                  borderColor: context.color.background1,
                                  appButtonType: watch.clientAge ? AppButtonType.filled : AppButtonType.outlined,
                                  height: 40,
                                  width: 62,
                                  borderRadius: BorderRadius.circular(24),
                                  onPressed: () {
                                    read.clientAge = !read.clientAge;
                                    print('kkkaaaaaa   ${read.clientAge}');
                                    read.onSetState();
                                  },
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
                                  appButtonType:  read.experienceWithIdentitySearch ? AppButtonType.outlined : AppButtonType.filled,
                                  borderColor: context.color.background1,
                                  contentPadding: EdgeInsets.all(8),
                                  height: 40,
                                  width: 62,
                                  borderRadius: BorderRadius.circular(24),
                                  onPressed: () {
                                    read.experienceWithIdentitySearch = !read.experienceWithIdentitySearch;
                                    read.onSetState();
                                  },
                                  text: 'Да',
                                ),
                                12.wGap,
                                AppButton(
                                  borderColor: context.color.background1,
                                  appButtonType: read.experienceWithIdentitySearch ? AppButtonType.filled : AppButtonType.outlined,
                                  height: 40,
                                  width: 62,
                                  borderRadius: BorderRadius.circular(24),
                                  onPressed: () {
                                    read.experienceWithIdentitySearch = !read.experienceWithIdentitySearch;
                                    read.onSetState();
                                  },
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
                                  appButtonType: watch.coupleTherapy ? AppButtonType.outlined : AppButtonType.filled,
                                  borderColor: context.color.background1,
                                  contentPadding: EdgeInsets.all(8),
                                  height: 40,
                                  width: 62,
                                  borderRadius: BorderRadius.circular(24),
                                  onPressed: () {
                                    read.coupleTherapy = !read.coupleTherapy;
                                    read.onSetState();
                                  },
                                  text: 'Да',
                                ),
                                12.wGap,
                                AppButton(
                                  borderColor: context.color.background1,
                                  appButtonType: watch.coupleTherapy ? AppButtonType.filled : AppButtonType.outlined,
                                  height: 40,
                                  width: 62,
                                  borderRadius: BorderRadius.circular(24),
                                  onPressed: () {
                                    read.coupleTherapy = !read.coupleTherapy;
                                    read.onSetState();
                                  },
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
                              onPressed: () {
                                read.patchSpecialization(context);
                              },
                              text: 'Сохранить изменения',
                            ),
                            20.hGap,
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
                watch.profileItem[3]
                    ? SizedBox(
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
                                      titleStyle:
                                          context.textStyle.s14w500Manrope,
                                      controller:
                                          read.educationPlaceController[index],
                                      title: 'Место получения',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.25.wp(context),
                                    child: TextFieldWithTitle(
                                      titleStyle:
                                          context.textStyle.s14w500Manrope,
                                      controller:
                                          read.educationYearController[index],
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
                                read.educationPlaceController
                                    .add(TextEditingController());
                                read.educationYearController
                                    .add(TextEditingController());
                                read.onSetState();
                              },
                              text: 'Добавить',
                            ),
                            24.hGap,
                            AppButton(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 7),
                              width: double.infinity,
                              onPressed: () {
                                read.patchEducation(context);
                              },
                              text: 'Сохранить изменения',
                            ),
                            20.hGap,
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
                watch.profileItem[4]
                    ? SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            24.hGap,
                            Text('Часовой пояс', style: context.textStyle.s16w500Manrope,),
                            5.hGap,
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: context.color.base03,
                              ),
                              child: DropdownButton(
                                onChanged: (String? newValue) {
                                  read.timeZone = newValue;
                                  read.onSetState();
                                },
                                value: read.timeZones.any((tz) => tz["value"] == read.timeZone) ? read.timeZone : null,
                                isExpanded: true,
                                underline: const SizedBox.shrink(),
                                borderRadius: BorderRadius.circular(5),
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                icon: Icon(Icons.keyboard_arrow_down),
                                style: context.textStyle.s16w500Manrope,
                                // itemHeight: kMinInteractiveDimension + 30,
                                itemHeight: null,
                                items: read.timeZones.map<DropdownMenuItem<String>>((tz) {
                                  return DropdownMenuItem<String>(
                                    value: tz["value"], // API-dan kelgan qiymat
                                    child: Text(tz["name"]!), // Foydalanuvchi ko‘radigan matn
                                  );
                                }).toList(),
                              ),
                            ),
                            24.hGap,
                            DropDownWithTitle(
                              title: 'Минимальное количество часов для записи',
                              onChanged: (value) {
                                read.sessionDuration = value;
                                read.onSetState();
                              },
                              dropdownValue: watch.sessionDuration,
                              items: ['1', '2','3'],
                            ),
                            24.hGap,
                            Text(
                              'Свободные слоты для записи клиентов',
                              style: context.textStyle.s16w600Manrope,
                            ),
                            20.hGap,
                            SizedBox(
                              width: context.width * 0.9,
                              height: 38,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      read.onWeekdaySelected(index);
                                    },
                                    child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        color: watch.weekdays[index] ? context.color.containerGreen : context.color.base03,
                                      ),
                                      padding: EdgeInsets.only(bottom: 2),
                                      width: context.width * 0.118,
                                      height: 38,
                                      margin: EdgeInsets.only(
                                        right: index == 6 ? 0 : context.width * 0.012,
                                      ),
                                      child: Center(
                                        child: Text(
                                          read.weekdaysItem[index],
                                          style: context.textStyle.s14w400Manrope.copyWith(
                                            color: watch.weekdays[index] ? context.color.background2 : context.color.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            24.hGap,
                            Text(
                              'Время', style: context.textStyle.s16w600Manrope,
                            ),
                            14.hGap,
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, // 4 ustun
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 1.7, // Containerning o'lchamini moslashtirish
                              ),
                              itemCount: read.times.length,
                              itemBuilder: (context, index) {
                                Color bgColor;
                                if (read.orangeIndexes.contains(index)) {
                                  bgColor = context.color.primary;
                                } else if (read.greenIndexes[read.weekdays.indexOf(true)].contains(index)) {
                                  bgColor = Color(0xFFDAF9DA);
                                } else {
                                  bgColor = context.color.background2;
                                }

                                return GestureDetector(
                                  onTap: () {
                                    read.changeTable(index);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: bgColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      read.times[index],
                                      style: context.textStyle.s14w400Manrope.copyWith(
                                        color: read.orangeIndexes.contains(index)
                                            ?  context.color.background2 : read.greenIndexes[read.weekdays.indexOf(true)].contains(index) ? context.color.text
                                            : context.color.textGrey3,
                                      ),
                                      // style: TextStyle(
                                      //   fontSize: 18,
                                      //   fontWeight: FontWeight.bold,
                                      //   color: read.grayIndexes.contains(index) ? Colors.grey.shade600 : Colors.black,
                                      // ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            24.hGap,
                            AppButton(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 7),
                              width: double.infinity,
                              onPressed: () {
                                read.patchClient(context);
                                read.patchTable(context);
                              },
                              text: 'Сохранить изменения',
                            ),
                            20.hGap,
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
                watch.profileItem[5]
                    ? SizedBox(
                        width: context.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            24.hGap,
                            Text(
                              'Имя',
                              style: context.textStyle.s14w500Manrope,
                            ),
                            8.hGap,
                            Text(
                              watch.nameController.text,
                              style: context.textStyle.s16w600Manrope,
                            ),
                            20.hGap,
                            Text(
                              'Фамилия',
                              style: context.textStyle.s14w500Manrope,
                            ),
                            8.hGap,
                            Text(
                              '',
                              style: context.textStyle.s16w600Manrope,
                            ),
                            20.hGap,
                            Text(
                              'Налоговый статус',
                              style: context.textStyle.s14w500Manrope,
                            ),
                            8.hGap,
                            Text(
                              '',
                              style: context.textStyle.s16w600Manrope,
                            ),
                            20.hGap,
                            Text(
                              'Статус',
                              style: context.textStyle.s14w500Manrope,
                            ),
                            8.hGap,
                            Text(
                              '',
                              style: context.textStyle.s16w600Manrope,
                            ),
                            20.hGap,
                            Text(
                              'Гражданство ',
                              style: context.textStyle.s14w500Manrope,
                            ),
                            8.hGap,
                            Text(
                              '',
                              style: context.textStyle.s16w600Manrope,
                            ),
                            20.hGap,
                            Text(
                              'Адрес',
                              style: context.textStyle.s14w500Manrope,
                            ),
                            8.hGap,
                            Text(
                              '',
                              style: context.textStyle.s16w600Manrope,
                            ),
                            20.hGap,
                            Text(
                              'ИНН',
                              style: context.textStyle.s14w500Manrope,
                            ),
                            8.hGap,
                            Text(
                              '',
                              style: context.textStyle.s16w600Manrope,
                            ),
                            20.hGap,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppButton(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                  fillTextStyle: context.textStyle.s16w500inter,
                                  borderColor: context.color.background1,
                                  appButtonType: AppButtonType.outlined,
                                  height: 45,
                                  width: context.width * .44,
                                  borderRadius: BorderRadius.circular(16),
                                  onPressed: () {
                                    read.educationPlaceController
                                        .add(TextEditingController());
                                    read.educationYearController
                                        .add(TextEditingController());
                                    read.onSetState();
                                  },
                                  text: 'Паспорт',
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SvgPicture.asset(
                                      AppIcons.icContract1,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                AppButton(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                  fillTextStyle: context.textStyle.s16w500inter,
                                  borderColor: context.color.background1,
                                  appButtonType: AppButtonType.outlined,
                                  height: 45,
                                  width: context.width * .44,
                                  borderRadius: BorderRadius.circular(16),
                                  onPressed: () {
                                    read.educationPlaceController
                                        .add(TextEditingController());
                                    read.educationYearController
                                        .add(TextEditingController());
                                    read.onSetState();
                                  },
                                  text: 'Регистрация',
                                ),
                              ],
                            ),
                            20.hGap,
                            AppButton(
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                              fillTextStyle: context.textStyle.s16w500inter,
                              borderColor: context.color.background1,
                              appButtonType: AppButtonType.outlined,
                              height: 45,
                              width: context.width * .90,
                              borderRadius: BorderRadius.circular(16),
                              onPressed: () {
                                read.educationPlaceController
                                    .add(TextEditingController());
                                read.educationYearController
                                    .add(TextEditingController());
                                read.onSetState();
                              },
                              text: 'Договор',
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(
                                  AppIcons.icContract2,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            20.hGap,
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    ).loadingView(watch.isLoading);
  }
}
