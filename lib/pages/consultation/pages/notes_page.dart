import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/app_text_field2.dart';
import '../view_model/consultation_view_model.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late ConsultationViewModel consultationViewModel;
  @override
  void initState() {
    consultationViewModel = context.read<ConsultationViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await consultationViewModel.getNotes();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ConsultationViewModel>();
    final watch = context.watch<ConsultationViewModel>();
    final readChat = context.read<ChatViewModel>();
    final watchChat = context.read<ChatViewModel>();
    return PopScope(
      canPop: !watchChat.isMessageOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          readChat.isMessageOpen = false;
          setState(() {});
          read.selectNavigation = "Расписание";
          context.pop();
          // readConsultation.onDrawerSelected(context, 1);
          // read.setState();
        }
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                readChat.isMessageOpen = false;
                read.onSetState();
                context.pop();
              },
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.arrow_left,
                    color: context.color.primary,
                  ),
                  6.wGap,
                  Text(
                    'Назад',
                    style: context.textStyle.s16w500Manrope
                        .copyWith(color: context.color.primary),
                  ),
                ],
              ),
            ),
            16.hGap,
            Text('Заметки', style: context.textStyle.s20w600Manrope),
            6.hGap,
            Text('Специалист ответит в удобное время Вам в чате', style: context.textStyle.s14w400Manrope),
            10.hGap,
            // Expanded(child: SizedBox.shrink()),
            Expanded(
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: context.color.base01,
                  ),
                  // child: Text('gfdshb'),
                  child: Text(read.notes[index].text, style: context.textStyle.s14w500Manrope,),
                ),
                itemCount: read.notes.length,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextField2(
                    fillColor: context.color.base04,
                    onTap: () {
                      // Future.delayed(
                      // Duration(milliseconds: 300), read.scrollToBottom);
                    },
                    controller: read.noteController,
                    hintText: 'Введите текст',
                    hintStyle: context.textStyle.s14w500Manrope
                        .copyWith(color: context.color.accent1),
                  ),
                ),
                Transform.rotate(
                  angle: -35 * math.pi / 180,
                  child: IconButton(
                    onPressed: () {
                      read.postNote();
                    },
                    icon: Icon(
                      Icons.send_rounded,
                      color: context.color.primary,
                      size: 30,
                    ),
                  ),
                ).padding(EdgeInsets.only(bottom: 5)),
              ],
            )
          ],
        ).padding(EdgeInsets.all(16)),
      ).loadingView(watch.isLoading),
    );
  }
}
