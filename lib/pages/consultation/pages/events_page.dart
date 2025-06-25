import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/pages/items/event_item.dart';
import 'package:provider/provider.dart';

import '../view_model/chat_view_model.dart';
import '../view_model/client_view_model.dart';
import '../view_model/consultation_view_model.dart';

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
          Container(
            height: 300,
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            width: context.width,
            margin: EdgeInsets.only(top: 4, left: 4, right: 4),
            // padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: context.color.background2,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [],
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
                read.eventsList.isEmpty? 500.hGap: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: read.eventsList.length, // nechta element b k b
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
