import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/chat_view_model.dart';
import '../view_model/consultation_view_model.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  late ConsultationViewModel read;
  late ChatViewModel readChat;
  @override
  void initState() {
    read = context.read<ConsultationViewModel>();
    readChat = context.read<ChatViewModel>();
    readChat.isMessageOpen = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      // await Future.delayed(Duration(milliseconds: 400),);
      if(!readChat.isMessageOpen) {
        // read.motionTabBarController?.index = 0;
      }
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
