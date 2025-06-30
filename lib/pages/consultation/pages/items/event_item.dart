import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/pages/consultation/data/models/event_model.dart';

import '../../../../router/router.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(RouteNames.eventsItem, extra: eventModel);
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        width: context.width,
        decoration: BoxDecoration(
          color: context.color.containerBackgroundF5,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                    image: NetworkImage(eventModel.icon), fit: BoxFit.cover),
              ),
            ),
            20.hGap,
            Text(
              eventModel.author,
              style: context.textStyle.s14w500Manrope.copyWith(
                color: context.color.primary,
              ),
            ),
            4.hGap,
            Text(
              eventModel.title,
              style: context.textStyle.s16w600Manrope,
            ),
            4.hGap,
            Text(
              eventModel.subtitle,
              style: context.textStyle.s14w400Manrope,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            12.hGap,
            Text(
              eventModel.dateCreated,
              style: context.textStyle.s14w500Manrope,
            ),
          ],
        ),
      ),
    );
  }
}
