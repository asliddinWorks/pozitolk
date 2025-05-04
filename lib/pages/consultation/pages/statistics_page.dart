import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/chat_view_model.dart';
import '../view_model/consultation_view_model.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late ConsultationViewModel read;
  late ChatViewModel readChat;
  @override
  void initState() {
    read = context.read<ConsultationViewModel>();
    readChat = context.read<ChatViewModel>();
    readChat.isMessageOpen = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async{
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
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
