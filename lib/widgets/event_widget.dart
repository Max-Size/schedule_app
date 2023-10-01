import 'package:flutter/cupertino.dart';
import 'package:schedule_app/styles/text_styles.dart';
import '../logic/event.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 3,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: CupertinoColors.systemIndigo),
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
          Column(
            children: [
              Text(
                  '${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}'),
              Text(
                  '${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}')
            ],
          ),
        ],
      ),
    );
  }
}
