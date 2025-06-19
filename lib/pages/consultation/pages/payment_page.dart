import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:provider/provider.dart';
import '../view_model/chat_view_model.dart';
import '../view_model/client_view_model.dart';
import '../view_model/consultation_view_model.dart';
import 'items/payment_item.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late ChatViewModel readChat;
  late ConsultationViewModel read;
  late ClientViewModel clientViewModel;
  @override
  void initState() {
    read = context.read<ConsultationViewModel>();
    readChat = context.read<ChatViewModel>();
    clientViewModel = context.read<ClientViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      clientViewModel.getPayments();
      if (!readChat.isMessageOpen) {
        print('uutt');
      }
      readChat.isMessageOpen = true;
      // await Future.delayed(Duration(microseconds: 200),);
      // read.onDrawerSelected(context, 7);
      read.onSetState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<ClientViewModel>();
    return Scaffold(
      backgroundColor: context.color.background1,
      body: Container(
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
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'История платежей',
                style: context.textStyle.s20w600Manrope,
              ),
              16.hGap,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  children: [
                    SizedBox(
                      width: context.width * 0.29,
                      child: Text(
                        'Дата',
                        style: context.textStyle.s14w400Manrope
                            .copyWith(fontSize: 13, color: context.color.textGrey),
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.29,
                      child: Text(
                        'Сумма',
                        style: context.textStyle.s14w400Manrope
                            .copyWith(fontSize: 13, color: context.color.textGrey),
                      ).padding(EdgeInsets.only(left: 16)),
                    ),
                    SizedBox(
                      width: context.width * 0.31,
                      child: Text(
                        'ID платежа',
                        style: context.textStyle.s14w400Manrope
                            .copyWith(fontSize: 13, color: context.color.textGrey),
                      ).padding(EdgeInsets.only(left: 16)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => PaymentItem(
                    paymentModel: clientViewModel.payments[index],
                  ),
                  itemCount: clientViewModel.payments.length,
                ),
              )
            ],
          ),
        ),
      ),
    ).loadingView(watch.isLoading);
  }
}
