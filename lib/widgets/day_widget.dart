import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/logic/days_of_week.dart';
import 'package:schedule_app/widgets/event_widget.dart';
import 'package:schedule_app/widgets/week_widget.dart';

import '../logic/event.dart';

class DayWidget extends StatefulWidget {
  final String dayName;
  final List<Event> events;

  DayWidget(this.dayName, this.events, {Key? key}) : super(key: key);

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {

  @override
  Widget build(BuildContext context) {
    if(widget.key!=null) print('it is created');
    if(kDebugMode){
      print(widget.events.length);
    }
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.dayName),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.events.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(child: EventWidget(widget.events[index])),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          widget.events.removeAt(index);
                        });
                      },
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
