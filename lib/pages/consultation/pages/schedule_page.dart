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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late ScrollController _verticalTimeController;
  late ScrollController _verticalContentController;
  late ScrollController _horizontalController;

  // Soatlar 06:00 dan 22:00 gacha
  final List<String> hours = List.generate(
    22 - 6 + 1,
        (i) => '${(6 + i).toString().padLeft(2, '0')}:00',
  );

  final DateTime startOfWeek = DateTime(2025, 5, 12);
  final int numberOfDays = 4;
  final Map<String, bool> selectedSlots = {};

  @override
  void initState() {
    super.initState();
    _verticalTimeController = ScrollController();
    _verticalContentController = ScrollController();
    _horizontalController = ScrollController();

    // Vertikal sinxronlashtirish
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
  }

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
      'янв', 'фев', 'мар', 'апр', 'май', 'июн',
      'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'
    ];
    return m[d.month - 1];
  }

  String _slotKey(String day, String hr) => '$day-$hr';

  @override
  Widget build(BuildContext context) {
    final days = List.generate(
      numberOfDays,
          (i) => startOfWeek.add(Duration(days: i)),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('📅 Jadval')),
      body: Row(
        children: [
          // Vaqtlar ustuni: 06:00-22:00, header uchun bo'sh joy
          SizedBox(
            width: 60,
            child: Column(
              children: [
                // Sarlavha uchun bo'sh joy (border qo'shildi)
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border(
                      // right: BorderSide(width: 1, color: Colors.grey),
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
                            right: BorderSide(width: 1, color: Colors.grey),
                            bottom: BorderSide(width: 1, color: Colors.grey),
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
          // const VerticalDivider(width: 1, thickness: 1, color: Colors.grey),

          // Jadval (kunlar + kataklar) – bitta gorizontal scroll ichida
          Expanded(
            child: SingleChildScrollView(
              controller: _horizontalController,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: numberOfDays * 120.0,
                child: Column(
                  children: [
                    // Kunlar sarlavhasi
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: days.map((d) {
                          return Container(
                            width: 120,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              border: Border(
                                // right: BorderSide(width: 1, color: Colors.grey),
                                bottom: BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                            child: Text(
                              '${getWeekday(d)}, ${d.day.toString().padLeft(2, '0')} ${getMonth(d)}',
                              style: const TextStyle(fontSize: 13),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // Divider o'chirildi, borderlar containerlarda

                    // Kataklar (vertikal ListView)
                    Expanded(
                      child: ListView.builder(
                        controller: _verticalContentController,
                        itemCount: hours.length,
                        itemBuilder: (_, row) {
                          return Row(
                            children: List.generate(numberOfDays, (col) {
                              final dayStr = DateFormat('yyyy-MM-dd').format(days[col]);
                              final hourStr = hours[row];
                              final key = _slotKey(dayStr, hourStr);
                              return Container(
                                width: 120,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(width: 1, color: Colors.grey),
                                    bottom: BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  // color: Colors.grey[200],
                                ),
                                child: Center(
                                  child: Checkbox(
                                    value: selectedSlots[key] ?? false,
                                    onChanged: (v) => setState(() {
                                      selectedSlots[key] = v!;
                                    }),
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
      ),
    );
  }
}