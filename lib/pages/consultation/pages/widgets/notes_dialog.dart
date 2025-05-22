import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/pages/consultation/pages/notes_page.dart';
import 'package:pozitolk/pages/consultation/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

import '../../view_model/consultation_view_model.dart';

class NotesDialog extends StatelessWidget {
  const NotesDialog({super.key, required this.details, required this.label});
  final TapDownDetails details;
  final String label;

  @override
  Widget build(BuildContext context) {
    final read = context.read<ConsultationViewModel>();
    final readChat = context.read<ChatViewModel>();
    return Positioned(
      left: details.globalPosition.dx- 105,
      top: details.globalPosition.dy - 190, // yuqoriroq chiqaramiz
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.color.background2, width: 8),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black26)],
          ),
          child: GestureDetector(
            onTap: ()async{
              read.removePopup();
              readChat.isMessageOpen = true;
              read.onSetState();
              await Navigator.push(context, MaterialPageRoute(builder: (context) => NotesPage()));
              // readChat.isMessageOpen = false;
              read.onSetState();
            },
            child: Container(
              height: 50,
              width: 180,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                // border: Border.all(color: context.color.background2, width: 8),
                color: context.color.primary,
                borderRadius: BorderRadius.circular(4),
                // boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black26)],
              ),
              child: FittedBox(
                child: Row(
                  children: [
                    Icon(Icons.notes, color: Colors.white),
                    13.wGap,
                    Text(
                      "Открыть заметки",
                      style: context.textStyle.s16w500Manrope.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
