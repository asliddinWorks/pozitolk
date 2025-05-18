// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../view_model/chat_view_model.dart';
// import '../view_model/consultation_view_model.dart';
//
// class SchedulePage extends StatefulWidget {
//   const SchedulePage({super.key});
//
//   @override
//   State<SchedulePage> createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//   late ConsultationViewModel read;
//   late ChatViewModel readChat;
//   @override
//   void initState() {
//     read = context.read<ConsultationViewModel>();
//     readChat = context.read<ChatViewModel>();
//     readChat.isMessageOpen = false;
//     WidgetsBinding.instance.addPostFrameCallback((_) async{
//       if(readChat.isMessageOpen) {
//         // read.motionTabBarController?.index = 2;
//       }
//       // await Future.delayed(Duration(milliseconds: 400),);
//       // read.profileItem[0] = true;
//       // read.isShow = true;
//       // read.key.currentState!.closeEndDrawer();
//       // read.onDrawerSelected(context, 7);
//       // read.onSetState();
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:pozitolk/core/extension/context_extension.dart';
// import 'package:pozitolk/core/extension/num_extension.dart';
//
// class SchedulePage extends StatefulWidget {
//   const SchedulePage({super.key});
//
//   @override
//   State<SchedulePage> createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//   late ScrollController _verticalTimeController;
//   late ScrollController _verticalContentController;
//   late ScrollController _horizontalController;
//
//   // Soatlar 06:00 dan 22:00 gacha
//   final List<String> hours = List.generate(
//     22 - 6 + 1,
//         (i) => '${(6 + i).toString().padLeft(2, '0')}:00',
//   );
//
//   final DateTime startOfWeek = DateTime(2025, 5, 12);
//   final int numberOfDays = 4;
//   final Map<String, bool> selectedSlots = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _verticalTimeController = ScrollController();
//     _verticalContentController = ScrollController();
//     _horizontalController = ScrollController();
//
//     // Vertikal sinxronlashtirish
//     _verticalTimeController.addListener(() {
//       if (_verticalContentController.offset != _verticalTimeController.offset) {
//         _verticalContentController.jumpTo(_verticalTimeController.offset);
//       }
//     });
//     _verticalContentController.addListener(() {
//       if (_verticalTimeController.offset != _verticalContentController.offset) {
//         _verticalTimeController.jumpTo(_verticalContentController.offset);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _verticalTimeController.dispose();
//     _verticalContentController.dispose();
//     _horizontalController.dispose();
//     super.dispose();
//   }
//
//   String getWeekday(DateTime d) {
//     const w = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
//     return w[d.weekday - 1];
//   }
//
//   String getMonth(DateTime d) {
//     const m = [
//       'янв', 'фев', 'мар', 'апр', 'май', 'июн',
//       'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'
//     ];
//     return m[d.month - 1];
//   }
//
//   String _slotKey(String day, String hr) => '$day-$hr';
//
//   @override
//   Widget build(BuildContext context) {
//     final days = List.generate(
//       numberOfDays,
//           (i) => startOfWeek.add(Duration(days: i)),
//     );
//
//     return Scaffold(
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Text('Расписание', style: context.textStyle.s20w600Manrope,),
//               Spacer(),
//               IconButton(onPressed: (){}, icon: Icon(Icons.chevron_left, size: 27,)),
//               Text('4 янв - 10 янв ', style: context.textStyle.s14w500Manrope,),
//               IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right, size: 27,)),
//             ],
//           ),
//           10.hGap,
//           Expanded(
//             child: Row(
//               children: [
//                 // Vaqtlar ustuni: 06:00-22:00, header uchun bo'sh joy
//                 SizedBox(
//                   width: 60,
//                   child: Column(
//                     children: [
//                       // Sarlavha uchun bo'sh joy (border qo'shildi)
//                       Container(
//                         height: 50,
//                         decoration: const BoxDecoration(
//                           border: Border(
//                             // right: BorderSide(width: 1, color: Colors.grey),
//                             bottom: BorderSide(width: 1, color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: ListView.builder(
//                           controller: _verticalTimeController,
//                           itemCount: hours.length,
//                           itemBuilder: (_, i) {
//                             return Container(
//                               height: 50,
//                               alignment: Alignment.center,
//                               decoration: const BoxDecoration(
//                                 border: Border(
//                                   // right: BorderSide(width: 1, color: Colors.grey),
//                                   bottom: BorderSide(width: 1, color: Colors.grey),
//                                 ),
//                               ),
//                               child: Text(hours[i]),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const VerticalDivider(width: 1, thickness: 1, color: Colors.grey),
//
//                 // Jadval (kunlar + kataklar) – bitta gorizontal scroll ichida
//                 Expanded(
//                   child: SingleChildScrollView(
//                     controller: _horizontalController,
//                     scrollDirection: Axis.horizontal,
//                     child: SizedBox(
//                       width: numberOfDays * 120.0,
//                       child: Column(
//                         children: [
//                           // Kunlar sarlavhasi
//                           SizedBox(
//                             height: 50,
//                             child: Row(
//                               children: days.map((d) {
//                                 return Container(
//                                   width: 120,
//                                   alignment: Alignment.center,
//                                   padding: const EdgeInsets.all(8),
//                                   decoration: const BoxDecoration(
//                                     border: Border(
//                                       right: BorderSide(width: 1, color: Colors.grey),
//                                       bottom: BorderSide(width: 1, color: Colors.grey),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     '${getWeekday(d)}, ${d.day.toString().padLeft(2, '0')} ${getMonth(d)}',
//                                     style: const TextStyle(fontSize: 13),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                           // Divider o'chirildi, borderlar containerlarda
//
//                           // Kataklar (vertikal ListView)
//                           Expanded(
//                             child: ListView.builder(
//                               controller: _verticalContentController,
//                               itemCount: hours.length,
//                               itemBuilder: (_, row) {
//                                 return Row(
//                                   children: List.generate(numberOfDays, (col) {
//                                     final dayStr = DateFormat('yyyy-MM-dd').format(days[col]);
//                                     final hourStr = hours[row];
//                                     final key = _slotKey(dayStr, hourStr);
//                                     return Container(
//                                       width: 120,
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         border: Border(
//                                           right: BorderSide(width: 1, color: Colors.grey),
//                                           bottom: BorderSide(width: 1, color: Colors.grey),
//                                         ),
//                                         // color: Colors.grey[200],
//                                       ),
//                                       child: Center(
//                                         child: Checkbox(
//                                           value: selectedSlots[key] ?? false,
//                                           onChanged: (v) => setState(() {
//                                             selectedSlots[key] = v!;
//                                           }),
//                                         ),
//                                       ),
//                                     );
//                                   }),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/view_model/consultation_view_model.dart';
import 'package:provider/provider.dart';

import '../data/models/message_model.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late ConsultationViewModel consultationViewModel;
  late ScrollController _verticalTimeController;
  late ScrollController _verticalContentController;
  late ScrollController _horizontalController;

  // Soatlar 06:00 dan 22:00 gacha
  List<String> hours = List.generate(
    22 - 6 + 1,
    (i) => '${(6 + i).toString().padLeft(2, '0')}:00',
  );

  // void onCheckBoxChanged(SlotModel model) {
  //   late ConsultationViewModel consultationViewModel;
  //   setState(() {
  //     model.isChecked = !model.isChecked!; // Tanlangan holatni teskari qilish
  //   });
  // }

  // Hozirgi kundan boshlanadigan hafta
  late DateTime currentWeekStart;
  int weekSelected = 0;
  final int numberOfDays = 7; // 5 kunlik hafta
  final int numberOfDays2 = 35; // 5 kunlik hafta

  final DateTime startOfWeek = DateTime(
      2025, 5, 12); // Haftaning boshlanish sanasi// Nechta kun olish kerak

  // Model: tanlangan va ro'yxatga kiritilgan sanalar

  final Map<String, bool> selectedSlots = {};
  late List<DateTime> days;
  // late List hours = [];
  @override
  // void initState() {
  //   super.initState();
  //   consultationViewModel = context.read<ConsultationViewModel>();
  //   currentWeekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
  //   _verticalTimeController = ScrollController();
  //   _verticalContentController = ScrollController();
  //   _horizontalController = ScrollController();
  //
  //   // Vertikal scrollni sinxronlashtirish
  //   _verticalTimeController.addListener(() {
  //     if (_verticalContentController.offset != _verticalTimeController.offset) {
  //       _verticalContentController.jumpTo(_verticalTimeController.offset);
  //     }
  //   });
  //
  //   _verticalContentController.addListener(() {
  //     if (_verticalTimeController.offset != _verticalContentController.offset) {
  //       _verticalTimeController.jumpTo(_verticalContentController.offset);
  //     }
  //   });
  //   // consultationViewModel = context.read<ConsultationViewModel>();
  //   // currentWeekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
  //   // _verticalTimeController = ScrollController();
  //   // _verticalContentController = ScrollController();
  //   // _horizontalController = ScrollController();
  //   final now = DateTime.now();
  //   final startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Dushanba
  //   final int numberOfWeeks = 5;
  //   final int numberOfDays = numberOfWeeks * 7;
  //
  //   // 5 hafta uchun kunlar ro'yxatini yaratish
  //   final days = List.generate(
  //     35, // 5 hafta = 7 kun * 5
  //         (i) => currentWeekStart.add(Duration(days: i)),
  //   );
  //
  //   // Soatlarni yaratish (06:00 - 22:00)
  //   hours = List.generate(16, (i) {
  //     final hour = i + 6;
  //     return '${hour.toString().padLeft(2, '0')}:00';
  //   });
  //
  //   // Barcha slotlarni yaratish
  //   List<SlotModel> allSlots = [];
  //   for (var day in days) {
  //     for (var hour in hours) {
  //       SlotModel slot = SlotModel(
  //         key: '${DateFormat('yyyy-MM-dd').format(day)} $hour',
  //         date: day,
  //         hour: hour,
  //       );
  //       allSlots.add(slot);
  //     }
  //   }
  //
  //
  //   // Avvaldan tanlangan slotlarni belgilash
  //   for (var slot in allSlots) {
  //     if (consultationViewModel.tableSelect.any((selected) => selected.key == slot.key)) {
  //       slot.isSelected = true;  // Slotni tanlang
  //     }
  //   }
  //
  //   // 5 hafta ichidagi barcha slotlarni tekshirib chiqing
  //   for (var slot in allSlots) {
  //     // faqat 5 hafta ichidagi slotlarni tekshiramiz
  //     if (slot.date.isAfter(now) && slot.date.isBefore(now.add(Duration(days: numberOfDays)))) {
  //       slot.isSelected = false;  // Slotni faqat hozirgi kunga mos qilib tanlang
  //     }
  //   }
  //
  //   // Tanlangan slotlarni yangilash
  //   setState(() {
  //     // Bu yerda `tableSelect` ni yangilashingiz mumkin, masalan:
  //     consultationViewModel.tableSelect = allSlots.where((slot) => slot.isSelected).toList();
  //   });
  // }

  @override
  void initState() {
    // consultationViewModel = context.read<ConsultationViewModel>();
    super.initState();
    consultationViewModel = context.read<ConsultationViewModel>();
    currentWeekStart =
        DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    _verticalTimeController = ScrollController();
    _verticalContentController = ScrollController();
    _horizontalController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await getSlot();
    });
    // Scroll sinxronizatsiya
    _verticalTimeController.addListener(() {
      if (_verticalContentController.offset != _verticalTimeController.offset) {
        _verticalContentController.jumpTo(_verticalTimeController.offset);
      }
    });
    _verticalContentController.addListener(() {
      if (_verticalTimeController.offset != _verticalContentController.offset) {
        _verticalTimeController.jumpTo(_verticalContentController.offset);
      }
    });

    // Soatlar
    hours =
        List.generate(17, (i) => '${(6 + i).toString().padLeft(2, '0')}:00');

    // Kunlar
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    days =
        List.generate(numberOfDays2, (i) => startOfWeek.add(Duration(days: i)));

    // Slotlar
    List<SlotModel> allSlots = [];
    for (var day in days) {
      for (var hour in hours) {
        String date = '${DateFormat('yyyy-MM-dd').format(day)} $hour';
        SlotModel slot = SlotModel(
          datetime: DateTime.parse(date),
          // datetime:  day.add(Duration(hours: int.parse(hour.substring(0, 2)))),
        );
        // Oldindan tanlanganlar
        if (consultationViewModel.tableSelect
            .any((selected) => selected.datetime == slot.datetime)) {
          slot.isSelected = true;
        }
        allSlots.add(slot);
      }
    }

    // Yangi holatni saqlash
    setState(() {
      consultationViewModel.tableSelect =
          allSlots.where((s) => s.isSelected ?? false).toList();
    });
  }

  Future<void> getSlot() async{
    String startDate = DateFormat('yyyy-MM-dd').format(currentWeekStart);
    String endDate = DateFormat('yyyy-MM-dd').format(
      currentWeekStart.add(
        Duration(days: 6),
      ),
    );
    print('startDate: $startDate, endDate: $endDate');
    await consultationViewModel.getSlots(startDate, endDate);
  }
  // @override
  // void initState() {
  //   super.initState();
  //   consultationViewModel = context.read<ConsultationViewModel>();
  //   _verticalTimeController = ScrollController();
  //   _verticalContentController = ScrollController();
  //   _horizontalController = ScrollController();
  //
  //   // Hozirgi kunga to'g'ri kelgan hafta boshlanishi
  //   currentWeekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
  //
  //   // Vertikal sinxronlashtirish
  //   _verticalTimeController.addListener(() {
  //     if (_verticalContentController.offset != _verticalTimeController.offset) {
  //       _verticalContentController.jumpTo(_verticalTimeController.offset);
  //     }
  //   });
  //   _verticalContentController.addListener(() {
  //     if (_verticalTimeController.offset != _verticalContentController.offset) {
  //       _verticalTimeController.jumpTo(_verticalContentController.offset);
  //     }
  //   });
  //   for (var day in days) {
  //     for (var hour in hours) {
  //       final key = '$day $hour';
  //       final isChecked = consultationViewModel.tableSelect.any((model) => model['key'] == key);  // Tekshiruv
  //
  //       // Agar key ro'yxatda mavjud bo'lsa, uni tanlang
  //       if (isChecked) {
  //         // Tanlanganlar ro'yxatini yangilash
  //         selectedSlots[key] = true;
  //       } else {
  //         // Agar mavjud bo'lmasa, tanlanmagan deb belgilash
  //         selectedSlots[key] = false;
  //       }
  //     }
  //   }
  // }

  @override
  void dispose() {
    _verticalTimeController.dispose();
    _verticalContentController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  String getWeekday(DateTime d) {
    const w = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    return w[d.weekday - 1];
  }

  String getMonth(DateTime d) {
    const m = [
      'Янв',
      'Фев',
      'Мар',
      'Апр',
      'Май',
      'Июн',
      'Июл',
      'Авг',
      'Сен',
      'Окт',
      'Ноя',
      'Дек'
    ];
    return m[d.month - 1];
  }

  void goToPreviousWeek()async {
      weekSelected = weekSelected - 1;
      currentWeekStart = currentWeekStart.subtract(Duration(days: 7));
      await getSlot();
      setState(() {});
  }

  void goToNextWeek()async {
      weekSelected = weekSelected + 1;
      currentWeekStart = currentWeekStart.add(Duration(days: 7));
      await getSlot();
      setState(() {});
  }

  // Modelni tekshirish va qayta qo'shish yoki olib tashlash
  void toggleSelection(SlotModel model) {
    setState(() {
      // print(model.isChecked);
      // if(model.isChecked == false) {
      //   model.isChecked = true;
      // }
      // model.isChecked = !model.isChecked;
      final index = consultationViewModel.tableSelect
          .indexWhere((m) => m.datetime == model.datetime);

      if (model.isChecked!) {
        if (index < 0) {
          consultationViewModel.tableSelect.add(model);
          // print('model.key: ${model.key}');
        }
      } else {
        if (index >= 0) {
          consultationViewModel.tableSelect.removeAt(index);
          // print('model.key: ${model.key}');
        }
      }
      // if(model.isChecked == false) {
      //   if (index >= 0) {
      //     consultationViewModel.tableSelect.removeAt(index);
      //     print('model.key: ${model.key}');
      //   }
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final read = context.read<ConsultationViewModel>();
    final watch = context.watch<ConsultationViewModel>();
    final days = List.generate(
      numberOfDays,
      (i) => currentWeekStart.add(Duration(days: i)),
    );

    return Scaffold(
      backgroundColor: context.color.background1,
      body: Container(
        // padding: EdgeInsets.all(16),
        height: context.height * .85,
        margin: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: context.color.background2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                16.wGap,
                SizedBox(
                  width: context.width * .35,
                  child: FittedBox(
                    child: GestureDetector(
                      onTap: () async {
                        // await read.getSlots('1', '1');
                        setState(() {});
                      },
                      child: Text(
                        'Расписания',
                        style: context.textStyle.s20w600Manrope,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: weekSelected == 0 ? null : goToPreviousWeek,
                  // onPressed: ()async{
                  //   weekSelected == 0 ? null : goToPreviousWeek;
                  //   await getSlot();
                  // },
                  icon: Icon(
                    Icons.chevron_left,
                    size: 27,
                    color: weekSelected == 0 ? Colors.grey : null,
                  ),
                ),
                SizedBox(
                  width: context.width * .3,
                  child: FittedBox(
                    child: Text(
                      '${DateFormat(
                        'dd MMM',
                      ).format(currentWeekStart)} - ${DateFormat(
                        'dd MMM',
                      ).format(currentWeekStart.add(Duration(days: 6)))}',
                      style: context.textStyle.s14w500Manrope,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: weekSelected == 4 ? null : goToNextWeek,
                  // onPressed: ()async{
                  //   weekSelected == 4 ? null : goToNextWeek;
                  //   await getSlot();
                  // },
                  icon: Icon(
                    Icons.chevron_right,
                    size: 27,
                    color: weekSelected == 4 ? Colors.grey : null,
                  ),
                ),
              ],
            ),
            10.hGap,
            Expanded(
              child: Row(
                children: [
                  // Vaqtlar ustuni: 06:00-22:00, header uchun bo'sh joy
                  SizedBox(
                    width: 60,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: _verticalTimeController,
                            itemCount: hours.length,
                            itemBuilder: (_, i) {
                              return Container(
                                height: 50,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                ),
                                child: Text(hours[i]),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                      width: 1, thickness: 1, color: Colors.grey),

                  // Jadval (kunlar + kataklar) – bitta gorizontal scroll ichida
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _horizontalController,
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: numberOfDays * 125.0,
                        child: Column(
                          children: [
                            // Kunlar sarlavhasi
                            SizedBox(
                              height: 50,
                              child: Row(
                                children: days.map((d) {
                                  return Container(
                                    width: 125,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            width: 1, color: Colors.grey),
                                        bottom: BorderSide(
                                            width: 1, color: Colors.grey),
                                      ),
                                    ),
                                    child: Text(
                                      '${getWeekday(d)}, ${d.day.toString().padLeft(2, '0')} ${getMonth(d)}',
                                      style: const TextStyle(fontSize: 13),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            // Kataklar (vertikal ListView)
                            Expanded(
                              child: ListView.builder(
                                controller: _verticalContentController,
                                itemCount: hours.length,
                                itemBuilder: (_, row) {
                                  return Row(
                                    children:
                                        List.generate(numberOfDays, (col) {
                                      final dayStr = DateFormat('yyyy-MM-dd')
                                          .format(days[col]);
                                      final hourStr = hours[row];
                                      // final String key = '$dayStr $hourStr';
                                      final DateTime dateTime = DateTime.parse(
                                        '$dayStr $hourStr',
                                      );
                                      final isChecked = consultationViewModel
                                          .tableSelect
                                          .any((model) =>
                                              model.datetime == dateTime);

                                      return Container(
                                        width: 125,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                                width: 1, color: Colors.grey),
                                            bottom: BorderSide(
                                                width: 1, color: Colors.grey),
                                          ),
                                        ),
                                        child: Center(
                                          child: Checkbox(
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              if (value != null) {
                                                final model = SlotModel(
                                                  datetime: dateTime,
                                                  // date: days[col],
                                                  // hour: hours[row],
                                                  isChecked: value,
                                                );
                                                toggleSelection(model);
                                                print(consultationViewModel
                                                        .tableSelect.isEmpty
                                                    ? []
                                                    : consultationViewModel
                                                        .tableSelect[0]
                                                        .datetime);
                                              }
                                            },
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ).padding(EdgeInsets.symmetric(horizontal: 16)),
            ),
          ],
        ),
      ),
    ).loadingView(watch.isLoading);
  }
}
