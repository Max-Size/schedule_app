import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/logic/days_of_week.dart';
import 'package:schedule_app/widgets/day_widget.dart';

class WeekWidget extends StatelessWidget {
  const WeekWidget({Key? key}) : super(key: key);


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
          DayWidget('Monday', DaysOfWeek.mondayEvents),
          DayWidget('Tuesday', DaysOfWeek.tuesdayEvents),
          DayWidget('Wednesday', DaysOfWeek.wednesdayEvents),
          DayWidget('Thursday', DaysOfWeek.thursdayEvents),
          DayWidget('Friday', DaysOfWeek.fridayEvents),
          DayWidget('Saturday', DaysOfWeek.saturdayEvents),
          DayWidget('Sunday', DaysOfWeek.sundayEvents)
        ]),
      ),
    );
  }
}

