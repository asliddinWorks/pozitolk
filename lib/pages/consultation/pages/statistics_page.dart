import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/pages/widgets/session_item.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/format_date.dart';
import '../data/models/statistics_model.dart';
import '../view_model/chat_view_model.dart';
import '../view_model/client_view_model.dart';
import '../view_model/consultation_view_model.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late ConsultationViewModel read;
  late ChatViewModel readChat;
  late ClientViewModel clientViewModel;

  @override
  void initState() {
    read = context.read<ConsultationViewModel>();
    readChat = context.read<ChatViewModel>();
    clientViewModel = context.read<ClientViewModel>();
    readChat.isMessageOpen = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await clientViewModel.getStatistics();
      // if(readChat.isMessageOpen) {
      //   // readChat.isMessageOpen = false;
      // }
      // await Future.delayed(Duration(milliseconds: 400),);
      // read.profileItem[0] = true;
      // read.isShow = true;
      // read.key.currentState!.closeEndDrawer();
      // read.onDrawerSelected(context, 7);
      // read.motionTabBarController?.index = 1;
      // read.onSetState();

      // Ma'lumotlar olingandan keyin maxYValue ni hisoblaymiz
      if (clientViewModel.statisticsModel != null &&
          clientViewModel.statisticsModel!.lastYearSessions.isNotEmpty) {
        double calculatedMaxY = clientViewModel
            .statisticsModel!.lastYearSessions
            .map((session) => session.total.toDouble())
            .reduce((value, element) => value > element ? value : element);

        if (mounted) {
          setState(() {
            // Endi minimal 27 degan shart yo'q.
            // Shunchaki calculatedMaxY + 2 ni olamiz.
            // Lekin, agar calculatedMaxY 0 bo'lsa, maxYValueForChart 2 bo'lib qoladi.
            // Bu juda kichik bo'lishi mumkin. Shuning uchun, ehtimol,
            // baribir biror minimal umumiy balandlik kerakdir (masalan, 5 yoki 10).
            // Keling, minimal 5 degan shart qo'yamiz (bu 2 (bo'shliq) + 3 (minimal ma'lumot)).
            // Yoki siz o'zingiz uchun mos minimalni tanlang.
            // Agar hech qanday minimal bo'lmasin desangiz, shunchaki:
            // maxYValueForChart = calculatedMaxY + 2;
            // Lekin bu interval hisoblashda muammo tug'dirishi mumkin, agar maxYValueForChart juda kichik bo'lsa.

            double potentialMax = calculatedMaxY + 2;
            maxYValueForChart = potentialMax < 5
                ? 5
                : potentialMax; // Minimal umumiy balandlik 5
            // (yoki siz xohlagan boshqa qiymat)
          });
        }
      } else {
        // Agar ma'lumotlar bo'lmasa yoki bo'sh bo'lsa,
        // Y o'qining minimal balandligini o'rnatamiz.
        if (mounted) {
          setState(() {
            maxYValueForChart =
                5; // Yoki siz tanlagan boshqa minimal qiymat (masalan, intervalga mos)
          });
        }
      }
    });
    super.initState();
  }

  double maxYValueForChart = 0;
  final List<SessionData> sessionsDynamic = [
    SessionData('1 сессия', 190, null),
    SessionData('2 сессия', 136, -24),
    SessionData('3 сессия', 116, -15),
    SessionData('4 сессия', 97, -12),
    SessionData('5 сессия', 86, -11),
    SessionData('6 сессия', 78, -55),
    SessionData('7 сессия', 74, -10),
    SessionData('8 сессия', 69, -10),
    SessionData('9 сессия', 67, -10),
    SessionData('10+ сессий', 2, -10),
  ];

  @override
  Widget build(BuildContext context) {

    // final maxClients = sessionsDynamic.first.clients.toDouble();
    final int n = 12;
    final double w = 30; // ustun eni
    final double s = 4; // ustunlar orasidagi bo‘shliq

    final double chartWidth =
        n * w + (n - 1) * s; // 12*30 + 11*4 = 360 + 44 = 404 px
    final double kategoriyaKengligi = chartWidth / n; // 404 / 12 ≈ 33.67 px
    final double widthParam = w / kategoriyaKengligi; // 30 / 33.67 ≈ 0.89

    final watch = context.watch<ClientViewModel>();
    final read = context.read<ClientViewModel>();
    final sessions = read.statisticsModel?.lastYearSessions;
    final recent12Sessions = sessions != null && sessions.length > 12
        ? sessions.sublist(1) // 1-o‘rindagidan boshlab, 0-indexni tashlab
        : sessions;
    return Scaffold(
      backgroundColor: context.color.background1,
      body: SingleChildScrollView(
        child: read.statisticsModel != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    width: context.width,
                    margin: EdgeInsets.only(top: 4, left: 4, right: 4),
                    // padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: context.color.background2,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ваша статистика на ПозиТолк',
                          style: context.textStyle.s20w600Manrope,
                        ),
                        16.hGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 250,
                              width: context.width * 0.43,
                              padding: EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: context.color.background1,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Всего на ПозиТолк',
                                    style: context.textStyle.s14w400Manrope,
                                  ),
                                  8.hGap,
                                  Text(
                                    dateDifference(
                                        read.statisticsModel!.onPozitalkSince),
                                    style: context.textStyle.s20w600Manrope,
                                  ),
                                  8.hGap,
                                  Text(
                                    'Всего опыт ${read.statisticsModel?.totalExperience} лет',
                                    style: context.textStyle.s14w400Manrope,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 250,
                              width: context.width * 0.43,
                              padding: EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: context.color.background1,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Средняя длительность терапии',
                                    style: context.textStyle.s14w400Manrope,
                                  ),
                                  8.hGap,
                                  Text(
                                    '${read.statisticsModel!.avgDuration.averageSessions.toString()} сессий',
                                    style: context.textStyle.s20w600Manrope,
                                  ),
                                  8.hGap,
                                  Text(
                                    'Самая долгая ${read.statisticsModel?.avgDuration.longestSessions} сессий',
                                    style: context.textStyle.s14w400Manrope,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        16.hGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 250,
                              width: context.width * 0.43,
                              padding: EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: context.color.background1,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Всего клиентов',
                                    style: context.textStyle.s14w400Manrope,
                                  ),
                                  8.hGap,
                                  Text(
                                    read.statisticsModel!.totalClients
                                        .toString(),
                                    style: context.textStyle.s20w600Manrope,
                                  ),
                                  8.hGap,
                                  Text(
                                    'из них ${read.statisticsModel?.activeClients} активные клиенты',
                                    style: context.textStyle.s14w400Manrope,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 250,
                              width: context.width * 0.43,
                              padding: EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: context.color.background1,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Сессий за все время',
                                    style: context.textStyle.s14w400Manrope,
                                  ),
                                  8.hGap,
                                  Text(
                                    read.statisticsModel!.allTimeSessions
                                        .toString(),
                                    style: context.textStyle.s20w600Manrope,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        16.hGap,
                        Text(
                          'Сессий за последний год',
                          style: context.textStyle.s14w400Manrope,
                        ),
                        4.hGap,
                        Text(
                          '${read.statisticsModel?.lastYearSessionsCount} сессий',
                          style: context.textStyle.s20w600Manrope,
                        ),
                        16.hGap,
                        SizedBox(
                          height: 400,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: chartWidth,
                              child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(
                                  axisLabelFormatter: (args) {
                                    return ChartAxisLabel(
                                      read.monthToRussianShort(args
                                          .text), // label uchun ruscha oy nomi
                                      context.textStyle.s14w400Manrope
                                          .copyWith(fontSize: 12),
                                    );
                                  },
                                  majorTickLines: MajorTickLines(
                                      color: Colors.transparent, width: 0),
                                  axisLine: AxisLine(
                                    color: context.color.secondary200
                                        .withAlpha(100),
                                    width: 1,
                                  ),
                                ),
                                primaryYAxis: NumericAxis(
                                  minimum: 0,
                                  maximum: maxYValueForChart,
                                  interval:
                                      read.calculateInterval(maxYValueForChart),
                                  axisLine: AxisLine(
                                      color: Colors.transparent, width: 1),
                                  majorTickLines: MajorTickLines(
                                      color: Colors.transparent, width: 0),
                                  majorGridLines: MajorGridLines(
                                    width: 1,
                                    color: context.color.secondary200
                                        .withAlpha(100),
                                  ),
                                ),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <CartesianSeries<MonthlySession,
                                    String>>[
                                  StackedColumnSeries<MonthlySession, String>(
                                    dataSource: recent12Sessions,
                                    xValueMapper: (MonthlySession data, _) =>
                                        data.month,
                                    yValueMapper: (MonthlySession data, _) =>
                                        data.total,
                                    name: '',
                                    color: context.color.secondary200.withAlpha(150),
                                    width: widthParam,
                                    borderRadius: BorderRadius.circular(8),
                                    groupName: 'group1',
                                    dataLabelSettings: DataLabelSettings(
                                      isVisible: true,
                                      labelAlignment:
                                          ChartDataLabelAlignment.top,
                                      builder: (dynamic data,
                                          dynamic point,
                                          dynamic series,
                                          int pointIndex,
                                          int seriesIndex) {
                                        final MonthlySession session =
                                            data as MonthlySession;
                                        if (session.total == 0) {
                                          return SizedBox
                                              .shrink(); // yoki Container()
                                        }
                                        return Text(
                                          session.total.toString(),
                                          style: context
                                              .textStyle.s14w500Manrope
                                              .copyWith(fontSize: 12),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        20.hGap,
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    width: context.width,
                    margin: EdgeInsets.only(top: 4, left: 4, right: 4),
                    // padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: context.color.background2,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Динамика отношений с клиентами',
                          style: context.textStyle.s14w400Manrope,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(16.0),
                        //   child: ListView.builder(
                        //     physics: NeverScrollableScrollPhysics(),
                        //     shrinkWrap: true,
                        //     itemCount: sessionsDynamic.length,
                        //     itemBuilder: (context, index) {
                        //       final sessionDynamic = sessionsDynamic[index];
                        //       final widthFactor =
                        //           sessionDynamic.clients / maxClients;
                        //
                        //       return Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(vertical: 6.0),
                        //         child: Row(
                        //           children: [
                        //             SizedBox(
                        //               width: 90,
                        //               child: Text(sessionDynamic.label),
                        //             ),
                        //             Expanded(
                        //               child: Stack(
                        //                 children: [
                        //                   FractionallySizedBox(
                        //                     widthFactor: widthFactor,
                        //                     child: Container(
                        //                       height: 30,
                        //                       decoration: BoxDecoration(
                        //                         color: Colors.lightGreen[200],
                        //                         borderRadius:
                        //                             BorderRadius.circular(20),
                        //                       ),
                        //                       alignment: Alignment.centerLeft,
                        //                       padding: EdgeInsets.symmetric(
                        //                           horizontal: 8),
                        //                       child: Text(
                        //                         '${sessionDynamic.clients}',
                        //                         style: TextStyle(fontSize: 12),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //             if (sessionDynamic.diff != null) ...[
                        //               SizedBox(width: 10),
                        //               Container(
                        //                 padding: EdgeInsets.symmetric(
                        //                     horizontal: 10, vertical: 5),
                        //                 decoration: BoxDecoration(
                        //                   color: Colors.green[400],
                        //                   borderRadius:
                        //                       BorderRadius.circular(20),
                        //                 ),
                        //                 child: Text(
                        //                   '${sessionDynamic.diff}',
                        //                   style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontSize: 12,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ]
                        //           ],
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                        SessionItem(sessionsDynamic: read.statisticsModel!.sessionDynamics,),
                        100.hGap,
                      ],
                    ),
                  ),
                ],
              )
            : SizedBox.shrink(),
      ),
    ).loadingView(watch.isLoading);
  }
}

class SessionData {
  final String label;
  final int clients;
  final int? diff;

  SessionData(this.label, this.clients, this.diff);
}
