import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/pages/items/client_item.dart';
import 'package:pozitolk/pages/consultation/view_model/client_view_model.dart';
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
  late ClientViewModel clientViewModel;
  @override
  void initState() {
    read = context.read<ConsultationViewModel>();
    readChat = context.read<ChatViewModel>();
    clientViewModel = context.read<ClientViewModel>();
    readChat.isMessageOpen = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      clientViewModel.getClients();
      if (!mounted) return;
      await context.read<ConsultationViewModel>().getUser();
      if (!mounted) return;
      await context.read<ConsultationViewModel>().getTable();
      // await Future.delayed(Duration(milliseconds: 400),);
      if (!readChat.isMessageOpen) {
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
    final watch = context.watch<ClientViewModel>();
    final read = context.read<ClientViewModel>();
    return Scaffold(
      // backgroundColor: Colors.redAccent,
      backgroundColor: context.color.background1,
      body: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Клиенты', style: context.textStyle.s20w600Manrope),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 55,
                        height: 56,
                        child: Text('Фото:',
                            style: context.textStyle.s14w400Manrope),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 220,
                        height: 56,
                        padding: EdgeInsets.only(left: 16),
                        child: Text('Имя/Псевдоним',
                            style: context.textStyle.s14w400Manrope),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        height: 56,
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Количество консультаций',
                          style: context.textStyle.s14w400Manrope,
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        height: 56,
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Последняя консультация',
                          style: context.textStyle.s14w400Manrope,
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        height: 56,
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Следующая консультация',
                          style: context.textStyle.s14w400Manrope,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ).padding(EdgeInsets.symmetric(horizontal: 16)),
                  SizedBox(
                    height: context.height - 275,
                    width: 757,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: read.clients.length,
                      itemBuilder: (context, index) => ClientItem(
                        clientModel: read.clients[index],
                      ).padding(EdgeInsets.only(bottom: read.clients.length - 1 == index ? 40 : 0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).loadingView(watch.isLoading);
  }
}
