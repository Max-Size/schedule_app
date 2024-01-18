import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/widgets/day_widget.dart';



class WeekWidget extends StatelessWidget {
  const WeekWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('week widget created!');
    }
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(4),
        physics: BouncingScrollPhysics(),
        //TODO: Use here an InheritedMOdel
        //TODO: figure out why if doesn't work with children 'days of week'
        child: Column(children: [
          DayWidget('Monday'),
          DayWidget('Tuesday'),
          DayWidget('Wednesday'),
          DayWidget('Thursday'),
          DayWidget('Friday'),
          DayWidget('Saturday'),
          DayWidget('Sunday')
        ]),
      ),
    );
  }
}

