import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/chat_view_model.dart';
import '../view_model/consultation_view_model.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late ConsultationViewModel read;
  late ChatViewModel readChat;
  @override
  void initState() {
    read = context.read<ConsultationViewModel>();
    readChat = context.read<ChatViewModel>();
    readChat.isMessageOpen = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      if(readChat.isMessageOpen) {
        // read.motionTabBarController?.index = 2;
      }
      // await Future.delayed(Duration(milliseconds: 400),);
      // read.profileItem[0] = true;
      // read.isShow = true;
      // read.key.currentState!.closeEndDrawer();
      // read.onDrawerSelected(context, 7);
      // read.onSetState();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
