import 'package:flutter/material.dart';
import 'package:schedule_app/styles/text_styles.dart';
import '../logic/event.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  late final Color categoryColor;

  EventWidget(this.event, {Key? key}) : super(key: key) {
    if (event.category == 'Work') {
      categoryColor = Colors.deepPurpleAccent;
    } else {
      categoryColor = Colors.yellowAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 3,
            color: categoryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: TextStyles.eventNameStyle,
                ),
                Text(
                  event.place,
                  style: TextStyles.eventPlaceStyle,
                ),
              ],
            ),
          ),
          Text(
              '${event.startTime.hour}:${event.startTime.minute} - ${event.endTime.hour}:${event.endTime.minute}')
        ],
      ),
    );
  }
}
