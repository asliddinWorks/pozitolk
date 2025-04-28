import 'package:flutter/material.dart';
import 'package:pozitolk/core/data/data_source/local/app_local_data.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/pages/consultation/pages/items/chat_item.dart';
import 'package:pozitolk/pages/consultation/pages/widgets/new.dart';
import 'package:pozitolk/pages/consultation/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class ConsultationChatUi extends StatelessWidget {
  const ConsultationChatUi({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ChatViewModel>();
    return Container(
      padding: EdgeInsets.all(16),
      height: context.height * .85,
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: context.color.background2,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: ()async{
                Map userModel = await  AppLocalData.getUserModel;
                print('id  ${userModel['id']} ${userModel['phone']}  ${userModel}');
                // read.onMessage();
                Navigator.push(context, MaterialPageRoute(builder: (context) => New()));
              },
              child: Text(
                'Чаты',
                style: context.textStyle.s16w600Manrope.copyWith(fontSize: 20),
              ),
            ),
            16.hGap,
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ChatItem(
                index: index,
                chatModel: read.chatUsers[index],
              ),
              itemCount: read.chatUsers.length,
              // itemCount: 15,
            ),
            30.hGap
          ],
        ),
      ),
    );
  }
}
