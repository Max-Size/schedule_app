import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:schedule_app/widgets/event_widget.dart';

import '../logic/event.dart';
import '../styles/text_styles.dart';

final mondayKey = GlobalKey<_DayWidgetState>();
final tuesdayKey = GlobalKey<_DayWidgetState>();
final wednesdayKey = GlobalKey<_DayWidgetState>();
final thursdayKey = GlobalKey<_DayWidgetState>();
final fridayKey = GlobalKey<_DayWidgetState>();
final saturdayKey = GlobalKey<_DayWidgetState>();
final sundayKey = GlobalKey<_DayWidgetState>();

class DayWidget extends StatefulWidget {
  final String dayName;
  final List<Event> events;

  const DayWidget(this.dayName, this.events, {Key? key}) : super(key: key);

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  
  void addEvent(){
    if (kDebugMode) {
      print('event added!');
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    print('day widget builded');
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.dayName,
              style: TextStyles.dayNameStyle,
            ),
            if (widget.events.isEmpty)
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Пока что пусто...',
                  style: TextStyles.eventPlaceStyle,
                ),
              ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.events.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ClipRect(
                  child: Slidable(
                    endActionPane: ActionPane(
                        extentRatio: 0.15,
                        motion: const ScrollMotion(),
                        children: [SlidableAction(
                          onPressed: (BuildContext context){
                            setState(() {
                              widget.events.removeAt(index);
                            });
                          },
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        ]
                    ),
                    child: EventWidget(widget.events[index]),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
