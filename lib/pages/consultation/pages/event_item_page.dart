import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/utils/with_percent_opacity.dart';
import 'package:pozitolk/pages/consultation/data/models/event_model.dart';

import '../../../core/utils/event_text_format.dart';
import 'items/event_text_item.dart';

class EventItemPage extends StatefulWidget {
  const EventItemPage({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  State<EventItemPage> createState() => _EventItemPageState();
}

class _EventItemPageState extends State<EventItemPage> {
  @override
/* <<<<<<<<<<<<<<  ✨ Windsurf Command ⭐ >>>>>>>>>>>>>>>> */
  /// Builds the UI for the EventItemPage.
  ///
  /// This method returns a [Scaffold] widget with a specific background color.
  /// The body of the scaffold contains a [ListView] with a [Container] at the top,
  /// displaying a back navigation row with an arrow icon and a text label.
  ///
  /// The [context] parameter is used to retrieve theme and styling information.

/* <<<<<<<<<<  a2829704-e8fb-4b08-b3e6-032ed579aa40  >>>>>>>>>>> */
  Widget build(BuildContext context) {
    final List<String> points = extractLiTexts(widget.eventModel.body);
    return Scaffold(
      backgroundColor: context.color.background1,
      body: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: context.width * 0.3,
                margin: EdgeInsets.all(14),
                color: context.color.background1,
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.arrow_left, size: 24, color: context.color.primary600,),
                    6.wGap,
                    Text('Назад', style: context.textStyle.s16w500Manrope.copyWith(color: context.color.primary600),),
                  ],
                ),
              ),
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
                  widget.eventModel.title,
                  style: context.textStyle.s20w600Manrope,
                ),
                16.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.eventModel.author,
                      style: context.textStyle.s14w500Manrope.copyWith(
                        color: context.color.primary,
                      ),
                    ),
                    Text(
                      widget.eventModel.dateCreated,
                      style: context.textStyle.s14w500Manrope,
                    ),
                  ],
                ),
                12.hGap,
                Text(
                  widget.eventModel.subtitle,
                  style: context.textStyle.s16w500Manrope,
                ),
                40.hGap,
                Container(
                  height: 256,
                  width: 256,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(widget.eventModel.icon),
                        fit: BoxFit.cover),
                  ),
                ),
                20.hGap,
                Text(
                    extractTextBetweenEscapedTags(widget.eventModel.body, 'p')),
                20.hGap,
                CustomBulletList(items: points),
                20.hGap,
                Container(
                  width: context.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.color.primary.withPercentOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('«»', style: context.textStyle.s20w600Manrope.copyWith(fontSize: 24, fontWeight: FontWeight.w700, height: 0.6)),
                      8.wGap,
                      SizedBox(
                        width: context.width * 0.68,
                        child: Text(
                          extractBlockquoteText(widget.eventModel.body),
                          style: context.textStyle.s16w500Manrope,
                        ),
                      ),
                    ],
                  ),
                ),
                20.hGap,
                Text(
                  extractLastParagraph(widget.eventModel.body),
                  style: context.textStyle.s16w500Manrope,
                ),
                50.hGap,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
