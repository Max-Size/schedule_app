import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/logic/days_of_week.dart';
import 'package:schedule_app/logic/event.dart';
import 'package:schedule_app/widgets/day_widget.dart';

class WeekWidget extends StatelessWidget {
  WeekWidget({Key? key}) : super(key: key);

  final daysOfWeek = [
    DayWidget(
      'Monday',
      DaysOfWeek.mondayEvents,
      key: const Key('state'),
    ),
    DayWidget('Monday', [
      Event(
          name: 'Work',
          category: 'Work',
          startTime: const TimeOfDay(hour: 13, minute: 45),
          endTime: const TimeOfDay(hour: 14, minute: 45),
          place: 'University')
    ]),
    DayWidget('Monday', events),
    DayWidget('Monday', events),
    DayWidget('Monday', events),
    DayWidget('Monday', events)
  ];

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('week widget created!');
    }
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(4),
        physics: const BouncingScrollPhysics(),
        //TODO: figure out why if doesn't work with children 'days of week'
        child: Column(children: [
          DayWidget(
            'Monday',
            DaysOfWeek.mondayEvents,
            key: const Key('state'),
          ),
          DayWidget('Monday', [
            Event(
                name: 'Work',
                category: 'Work',
                startTime: const TimeOfDay(hour: 13, minute: 45),
                endTime: const TimeOfDay(hour: 14, minute: 45),
                place: 'University')
          ]),
          DayWidget('Monday', events),
          DayWidget('Monday', events),
          DayWidget('Monday', events),
          DayWidget('Monday', events)
        ]),
      ),
    );
  }
}

final events = <Event>[
  Event(
      name: 'Work',
      category: 'Work',
      startTime: const TimeOfDay(hour: 13, minute: 45),
      endTime: const TimeOfDay(hour: 14, minute: 45),
      place: 'Home'),
  Event(
      name: 'Watch Tv',
      category: 'Chill',
      startTime: const TimeOfDay(hour: 20, minute: 45),
      endTime: const TimeOfDay(hour: 21, minute: 45),
      place: 'University')
];
