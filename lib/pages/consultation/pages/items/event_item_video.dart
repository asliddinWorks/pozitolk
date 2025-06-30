import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/pages/consultation/pages/items/youtube_iframe_page.dart';
import '../../../../router/router.dart';
import '../../data/models/event_model.dart';

class EventItemVideo extends StatelessWidget {
  const EventItemVideo({super.key, required this.eventVideoModel, this.height});
  final EventVideoModel eventVideoModel;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 235,
      width: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                height: 135,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: context.color.background1,
                ),
                child: YouTubeTestPage(source: eventVideoModel.source,),
              ),
              SizedBox(
                height: 135,
                width: 240,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    onPressed: () {
                      context.push(RouteNames.fullScreenVideoPage, extra: eventVideoModel.source);
                    },
                    icon: const Icon(Icons.fullscreen, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          16.hGap,
          Text(
            eventVideoModel.type,
            style: context.textStyle.s16w600Manrope.copyWith(fontSize: 12, color: Color(0xFFA7ACAF)),
          ),
          2.hGap,
          Text(
            eventVideoModel.title,
            style: context.textStyle.s16w600Manrope,
          ),
          8.hGap,
          Text(
            eventVideoModel.description,
            style: context.textStyle.s14w500Manrope,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

        ],
      ),
    );
  }
}
