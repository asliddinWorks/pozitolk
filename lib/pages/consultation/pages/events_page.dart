import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pozitolk/constants/app_icons.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/pages/items/event_item.dart';
import 'package:provider/provider.dart';
import '../view_model/chat_view_model.dart';
import '../view_model/client_view_model.dart';
import '../view_model/consultation_view_model.dart';
import 'items/event_item_video.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late ChatViewModel readChat;
  late ConsultationViewModel readConsultation;
  late ClientViewModel clientViewModel;
  @override
  void initState() {
    readConsultation = context.read<ConsultationViewModel>();
    readChat = context.read<ChatViewModel>();
    clientViewModel = context.read<ClientViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      clientViewModel.getEvents();
      clientViewModel.getEventsVideo();
      if (!readChat.isMessageOpen) {
        print('uutt');
      }
      readChat.isMessageOpen = true;
      // await Future.delayed(Duration(microseconds: 200),);
      // read.onDrawerSelected(context, 7);
      clientViewModel.seeAll = false;
      readConsultation.onSetState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ClientViewModel>();
    final watch = context.watch<ClientViewModel>();
    return Scaffold(
      backgroundColor: context.color.background1,
      body: ListView(
        shrinkWrap: true,
        children: [
          read.eventsVideoList.isEmpty
              ? 0.hGap
              : watch.seeAll ? Container(
                  // height: 370,
                  // padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  width: context.width,
                  margin: EdgeInsets.only(top: 4, left: 4, right: 4),
                  // padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.color.background2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.hGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Новое',
                            style: context.textStyle.s20w600Manrope,
                          ),
                        ],
                      ).padding(EdgeInsets.symmetric(horizontal: 16)),
                      16.hGap,
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemCount: read.eventsVideoList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                right:
                                    read.eventsVideoList.length - 1 == index
                                        ? 0
                                        : 16),
                            child: EventItemVideo(
                              height: 310,
                              eventVideoModel: read.eventsVideoList[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ) :
          Container(
            height: 370,
            // padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            width: context.width,
            margin: EdgeInsets.only(top: 4, left: 4, right: 4),
            // padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.color.background2,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Новое',
                      style: context.textStyle.s20w600Manrope,
                    ),
                    GestureDetector(
                      onTap: () {
                        read.seeAll = true;
                        setState(() {});
                        // Navigator.push( context, MaterialPageRoute(builder:  (context) => EventItemVideo2(eventVideoModel: read.eventsVideoList[0],)));
                        // Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: context.width * 0.5,
                          margin: EdgeInsets.symmetric(vertical: 14),
                          color: context.color.background2,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Показать все',
                                style: context.textStyle.s16w600Manrope
                                    .copyWith(
                                  color: context.color.primary,
                                ),
                              ),
                              6.wGap,
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: SvgPicture.asset(
                                  AppIcons.icRightChevron,
                                  height: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ).padding(EdgeInsets.symmetric(horizontal: 16)),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: read.eventsVideoList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right:
                            read.eventsVideoList.length - 1 == index
                                ? 0
                                : 16),
                        child: EventItemVideo(
                          eventVideoModel: read.eventsVideoList[index],
                        ),
                      );
                    },
                  ),
                ),
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
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'События Позитолк',
                  style: context.textStyle.s20w600Manrope,
                ),
                read.eventsList.isEmpty
                    ? 800.hGap
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            read.eventsList.length, // nechta element b k b
                        itemBuilder: (context, index) {
                          return EventItem(
                            eventModel: read.eventsList[index],
                          );
                        },
                      ),
                50.hGap,
              ],
            ),
          ),
        ],
      ),
    ).loadingView(watch.isLoading);
  }
}
