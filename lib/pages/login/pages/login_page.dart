import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/core/widgets/app_button.dart';
import 'package:pozitolk/pages/login/pages/widgets/confirm_validation.dart';
import 'package:pozitolk/pages/login/view_model/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constants/app_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewModel loadViewModel;
  @override
  void initState() {
    loadViewModel = context.read<LoginViewModel>();
    loadViewModel.loadFromJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<LoginViewModel>();
    final watch = context.watch<LoginViewModel>();
    return Scaffold(
      backgroundColor: context.color.background2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.icLogo),
            5.wGap,
            Column(
              children: [
                3.hGap,
                Text(
                  'позитолк',
                  style: context.textStyle.s16w400.copyWith(fontSize: 17.5),
                ),
                // Text('Психотерапия brbhr', style: GoogleFonts.leckerliOne(color: context.color.primary)),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            width: 113,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.color.containerBackgroundF3,
            ),
            child: FittedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.icHelp,
                    height: 20,
                    width: 20,
                  ),
                  8.wGap,
                  Text('Помощь', style: context.textStyle.s16w600Manrope),
                ],
              ),
            ),
          ),
          16.wGap
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: AlignmentDirectional.topStart,
                              height: 36,
                              child: Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: context.color.primary),
                                  ),
                                  12.wGap,
                                  Text(
                                    'Вход в аккаунт',
                                    style:
                                        context.textStyle.s16w500inter.copyWith(
                                      color: context.color.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.topStart,
                              height: 36,
                              child: Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: watch.isPersonalQuestions
                                          ? context.color.primary
                                          : context.color.textBA.withAlpha(100),
                                    ),
                                  ),
                                  12.wGap,
                                  Text(
                                    'Личные вопросы',
                                    style:
                                        context.textStyle.s16w500inter.copyWith(
                                      color: watch.isPersonalQuestions
                                          ? context.color.primary
                                          : context.color.textBA,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.topStart,
                              height: 36,
                              child: Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: watch.isPersonalQuestions
                                          ? context.color.primary
                                          : context.color.textBA.withAlpha(100),
                                    ),
                                  ),
                                  12.wGap,
                                  Text(
                                    'Выбор психолога',
                                    style:
                                        context.textStyle.s16w500inter.copyWith(
                                      color: watch.isPersonalQuestions
                                          ? context.color.primary
                                          : context.color.textBA,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        watch.isPersonalQuestions
                            ? Container(
                                margin: EdgeInsets.only(left: 3, top: 14),
                                height: 38,
                                width: 2,
                                color: context.color.primary,
                              )
                            : SizedBox.shrink(),
                        watch.isPersonalQuestions
                            ? Container(
                                margin: EdgeInsets.only(left: 3, top: 48),
                                height: 38,
                                width: 2,
                                color: context.color.primary,
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                    64.hGap,
                    !watch.isConfirm
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                  'Введите номер телефона',
                                  style:
                                      context.textStyle.s20w500inter.copyWith(
                                    fontSize: 24,
                                    color: context.color.textGrey2,
                                  ),
                                ),
                                20.hGap,
                                Text(
                                  'Мы отправим код в SMS',
                                  style: context.textStyle.s16w500inter
                                      .copyWith(color: context.color.textGrey2),
                                ),
                                16.hGap,
                                IntlPhoneField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Colors.grey[200], // Orqa fon kulrang
                                    // hintText: '+7 999 999 99 99', // Telefon raqami uchun placeholder
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16), // Shaffof rang
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Burchaklarni yumshatish (16)
                                      borderSide: BorderSide
                                          .none, // Chegarani olib tashlash
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      // ❗ Xato bo‘lganda border ham 16px bo‘lsin
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                          color: Colors.red), // Qizil border
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      // ❗ Xato + aktiv holatda ham 16px bo‘lsin
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10), // Ichki oraliq
                                  ),
                                  initialCountryCode: 'RU', // Standart Rossiya
                                  dropdownIconPosition: IconPosition
                                      .leading, // Bayroqni chapga olish
                                  // flagsButtonPadding: EdgeInsets.only(right: 10), // Bayroqdan keyin bo‘sh joy qo‘shish
                                  // textStyle: TextStyle(fontSize: 18, color: Colors.black), // Telefon raqami uchun shrift
                                  dropdownTextStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors
                                          .black), // Bayroq qismidagi matn stili
                                  disableLengthCheck:
                                      false, // Raqam uzunligini tekshirishni yoqish
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                ),
                                // Row(
                                //   children: [
                                //     // Bayroq va dropdown
                                //     Container(
                                //       alignment: Alignment.center,
                                //       height: 50,
                                //       width: 85,
                                //       decoration: BoxDecoration(
                                //         color: Colors.grey.shade200,
                                //         borderRadius: BorderRadius.circular(16),
                                //       ),
                                //       padding:
                                //           EdgeInsets.symmetric(horizontal: 12),
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         children: [
                                //           SizedBox(
                                //             width: 24,
                                //             height: 16,
                                //             child: Image.network(
                                //               'https://upload.wikimedia.org/wikipedia/commons/d/d4/Flag_of_Russia.png',
                                //               width: 29,
                                //               height: 20,
                                //             ),
                                //           ),
                                //           SizedBox(width: 4),
                                //           Icon(Icons.arrow_drop_down,
                                //               color: Colors.black),
                                //         ],
                                //       ),
                                //     ),
                                //     SizedBox(width: 6),
                                //     // Telefon kodi
                                //     Expanded(
                                //       child: Container(
                                //         alignment: Alignment.center,
                                //         height: 50,
                                //         padding: EdgeInsets.symmetric(
                                //             horizontal: 12),
                                //         decoration: BoxDecoration(
                                //           color: Colors.grey.shade200,
                                //           borderRadius:
                                //               BorderRadius.circular(16),
                                //         ),
                                //         child: Row(
                                //           children: [
                                //             Text(
                                //               "+7",
                                //               style: context
                                //                   .textStyle.s20w500inter,
                                //             ),
                                //             Expanded(
                                //               child: TextField(
                                //                 keyboardType:
                                //                     TextInputType.number,
                                //                 inputFormatters: [
                                //                   FilteringTextInputFormatter
                                //                       .digitsOnly,
                                //                   LengthLimitingTextInputFormatter(
                                //                       10),
                                //                 ],
                                //                 decoration: InputDecoration(
                                //                   fillColor: Colors.transparent,
                                //                   border: InputBorder
                                //                       .none, // Chegarani olib tashlash
                                //                   enabledBorder: InputBorder
                                //                       .none, // Fokuslanmagan holatda ham chegara yo‘q
                                //                   focusedBorder:
                                //                       InputBorder.none,
                                //                   hintText: "999 999 99 99",
                                //                   hintStyle: TextStyle(
                                //                       color:
                                //                           context.color.textA4,
                                //                       fontSize: 18),
                                //                 ),
                                //                 style: context
                                //                     .textStyle.s20w500inter,
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(width: 8),
                                //     // Telefon raqami kiritish maydoni
                                //   ],
                                // ),
                              ])
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Введите код из SMS',
                                style: context.textStyle.s20w500inter.copyWith(
                                  fontSize: 24,
                                  color: context.color.textGrey2,
                                ),
                              ),
                              20.hGap,
                              Text(
                                'Код отправлен на +7 999 999 99 99',
                                style: context.textStyle.s16w500inter
                                    .copyWith(color: context.color.textGrey2),
                              ),
                              10.hGap,
                              SizedBox(
                                height: 50,
                                child: ConfirmPage(),
                              ),
                              16.hGap,
                              Text(
                                'Повторный код через 45 сек',
                                style: context.textStyle.s16w500inter.copyWith(
                                  color: context.color.textBA,
                                ),
                              ),
                            ],
                          ),

                    // InternationalPhoneNumberInput(
                    //   height: 60,
                    //   inputFormatters: [],
                    //   controller: read.phoneController,
                    //   formatter: MaskedInputFormatter('### ### ## ##'),
                    //   initCountry: CountryCodeModel(
                    //       name: "United States", dial_code: "+1", code: "US"),
                    //   betweenPadding: 23,
                    //
                    //   onInputChanged: (phone) {
                    //     print(phone.code);
                    //     print(phone.dial_code);
                    //     print(phone.number);
                    //     print(phone.rawFullNumber);
                    //     print(phone.rawNumber);
                    //     print(phone.rawDialCode);
                    //   },
                    //   loadFromJson: read.loadFromJson,
                    //   dialogConfig: DialogConfig(
                    //     backgroundColor: const Color(0xFF444448),
                    //     searchBoxBackgroundColor: const Color(0xFF56565a),
                    //     searchBoxIconColor: const Color(0xFFFAFAFA),
                    //     countryItemHeight: 55,
                    //     topBarColor: const Color(0xFF1B1C24),
                    //     selectedItemColor: const Color(0xFF56565a),
                    //     selectedIcon: Padding(
                    //       padding: const EdgeInsets.only(left: 10),
                    //       child: Image.asset(
                    //         "assets/check.png",
                    //         width: 20,
                    //         fit: BoxFit.fitWidth,
                    //       ),
                    //     ),
                    //     textStyle: TextStyle(
                    //         color: const Color(0xFFFAFAFA).withOpacity(0.7),
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w600),
                    //     searchBoxTextStyle: TextStyle(
                    //         color: const Color(0xFFFAFAFA).withOpacity(0.7),
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w600),
                    //     titleStyle: const TextStyle(
                    //         color: Color(0xFFFAFAFA),
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w700),
                    //     searchBoxHintStyle: TextStyle(
                    //         color: const Color(0xFFFAFAFA).withOpacity(0.7),
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w600),
                    //   ),
                    //   countryConfig: CountryConfig(
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //             width: 2, color: const Color(0xFF3f4046)),
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //       noFlag: false,
                    //       textStyle: const TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w600)),
                    //   validator: (number) {
                    //     if (number.number.isEmpty) {
                    //       return "The phone number cannot be left emptyssss";
                    //     }
                    //     return null;
                    //   },
                    //   phoneConfig: PhoneConfig(
                    //     focusedColor: const Color(0xFF6D59BD),
                    //     enabledColor: const Color(0xFF6D59BD),
                    //     errorColor: const Color(0xFFFF5494),
                    //     labelStyle: null,
                    //     labelText: null,
                    //     floatingLabelStyle: null,
                    //     focusNode: null,
                    //     radius: 8,
                    //     hintText: "Phone Number",
                    //     borderWidth: 2,
                    //     backgroundColor: Colors.transparent,
                    //     decoration: null,
                    //     popUpErrorText: true,
                    //     autoFocus: false,
                    //     showCursor: false,
                    //     textInputAction: TextInputAction.done,
                    //     autovalidateMode: AutovalidateMode.onUserInteraction,
                    //     errorTextMaxLength: 2,
                    //     errorPadding: const EdgeInsets.only(top: 14),
                    //     errorStyle: const TextStyle(
                    //         color: Color(0xFFFF5494), fontSize: 12, height: 1),
                    //     textStyle: const TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w400),
                    //     hintStyle: TextStyle(
                    //         color: Colors.black.withOpacity(0.5),
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w400),
                    //   ),
                    // ),
                    16.hGap,
                    // IntlPhoneField(
                    //   decoration: InputDecoration(
                    //     fillColor: Colors.white,
                    //     // labelText: 'Telefon raqamingiz',
                    //     border: OutlineInputBorder(
                    //       borderSide: BorderSide.none,
                    //     ),
                    //   ),
                    //   initialCountryCode: 'UZ', // O'zbekiston kodi
                    //   onChanged: (phone) {
                    //     print(phone.completeNumber);
                    //   },
                    // ),

                    // 16.hGap,
                    // Stack(
                    //   children: [
                    //     Container(
                    //       width: .7.wp(context),
                    //       height: 50,
                    //       decoration: BoxDecoration(
                    //         color: context.color.containerBackgroundF4,
                    //         borderRadius: BorderRadius.circular(16),
                    //       ),
                    //     ),
                    //     IntlPhoneField(
                    //       decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                    //         border: InputBorder.none, // Chegarani olib tashlash
                    //         enabledBorder: InputBorder.none, // Fokuslanmagan holatda ham chegara yo‘q
                    //         focusedBorder: InputBorder.none,
                    //         filled: true,
                    //         fillColor: Colors.transparent,
                    //       ),
                    //       initialCountryCode: 'RU',
                    //       dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    //       onChanged: (phone) {
                    //         print(phone.completeNumber);
                    //       },
                    //       inputFormatters: [
                    //         FilteringTextInputFormatter.digitsOnly, // Faqat raqam kiritish
                    //         LengthLimitingTextInputFormatter(10), // Maksimum 10 ta raqam
                    //       ],
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
          !watch.isConfirm
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        width: double.infinity,
                        onPressed: () {
                          read.onConfirm();
                        },
                        text: 'Получить код по SMS',
                      ),
                      16.hGap,
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Нажимая «Получить код» вы принимаете ',
                            style: context.textStyle.s13w500Inter,
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => launchUrlString(
                                    'https://xn--g1acgdmcd1a.xn--p1ai/docs/polz-sogl.pdf',
                                  ),
                            text: 'пользовательское соглашение, ',
                            style: context.textStyle.s13w500Inter
                                .copyWith(color: context.color.primary),
                          ),
                          TextSpan(
                            text: 'даете, ',
                            style: context.textStyle.s13w500Inter,
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => launchUrlString(
                                    'https://xn--g1acgdmcd1a.xn--p1ai/docs/pol-conf.pdf',
                                  ),
                            text: 'согласие на обработку персональных данных. ',
                            style: context.textStyle.s13w500Inter
                                .copyWith(color: context.color.primary),
                          ),
                        ]),
                      ),
                    ],
                  ).padding(EdgeInsets.all(16)),
                )
              : GestureDetector(
                  onTap: () => read.onConfirm(),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.arrow_left,
                        color: context.color.primary,
                        weight: 9,
                        size: 24,
                      ),
                      8.wGap,
                      Text(
                        'Назад к вводу номера',
                        style: context.textStyle.s16w500inter
                            .copyWith(color: context.color.primary),
                      ),
                    ],
                  ).padding(EdgeInsets.symmetric(horizontal: 16, vertical: 20)),
                ),
        ],
      ),
    );
  }
}
