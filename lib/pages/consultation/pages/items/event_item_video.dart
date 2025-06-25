import 'package:flutter/cupertino.dart';

import '../../data/models/event_model.dart';

class EventItemVideo extends StatelessWidget {
  const EventItemVideo({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: 240,
    );
  }
}
