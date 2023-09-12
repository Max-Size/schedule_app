import 'package:flutter/material.dart';
import 'package:schedule_app/logic/days_of_week.dart';
import 'package:schedule_app/logic/event.dart';

class EventDialogWidget extends StatefulWidget {
  const EventDialogWidget({
    super.key,
  });

  @override
  State<EventDialogWidget> createState() => _EventDialogWidgetState();
}

class _EventDialogWidgetState extends State<EventDialogWidget> {
  String pickedDay = 'Понедельник';
  TimeOfDay? startTime = TimeOfDay.now();
  TimeOfDay? endTime = TimeOfDay.now();
  var eventNameController = TextEditingController();
  var eventPlaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text('Add event'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Выберите дату:'),
            DropdownButton<String>(
              value: pickedDay,
              items: [
                for (var day in _daysOfWeek)
                  DropdownMenuItem(
                    value: day,
                    child: Text(day),
                  )
              ],
              onChanged: (String? value) {
                setState(() {
                  pickedDay = value!;
                });
              },
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Start time:'),
                    TextButton(
                      onPressed: () async {
                        startTime = await getTime(context);
                        setState(() {});
                      },
                      child: Text(
                          '${startTime?.hour.toString().padLeft(2, '0')}:${startTime!.minute.toString().padLeft(2, '0')}'),
                    )
                  ],
                ),
                const Expanded(
                    child: SizedBox(
                  height: 1,
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('End time:'),
                    TextButton(
                      onPressed: () async {
                        endTime = await getTime(context);
                        setState(() {});
                      },
                      child: Text(
                          '${endTime?.hour.toString().padLeft(2, '0')}:${endTime!.minute.toString().padLeft(2, '0')}'),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5,),
            const Text('Event name:'),
            TextField(
                controller: eventNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'EventName...',
                )),
            const SizedBox(height: 5,),
            const Text('Event place:'),
            TextField(
              controller: eventPlaceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'EventPlace...',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              addEvent(
                  eventNameController: eventNameController,
                  startTime: startTime!,
                  endTime: endTime!,
                  weekDay: pickedDay,
              place: eventPlaceController.text);
              Navigator.of(context).pop();
            },
            child: const Text('add')),
      ],
    );
  }
}


Future<TimeOfDay?> getTime(BuildContext context) {
  return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      });
}

void addEvent(
    {required TextEditingController eventNameController,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required String weekDay,
    required String place}) {
  final event = Event(
      name: eventNameController.text,
      startTime: startTime,
      endTime: endTime,
      place: place);
  switch (weekDay) {
    case 'Понедельник':
      DaysOfWeek.addMondayEvent(event);
      break;
    case 'Вторник':
      DaysOfWeek.addTuesdayEvent(event);
      break;
    case 'Среда':
      DaysOfWeek.addWednesdayEvent(event);
      break;
    case 'Четверг':
      DaysOfWeek.addThursdayEvent(event);
      break;
    case 'Пятница':
      DaysOfWeek.addFridayEvent(event);
      break;
    case 'Суббота':
      DaysOfWeek.addSaturdayEvent(event);
      break;
    case 'Воскресенье':
      DaysOfWeek.addSundayEvent(event);
  }
}

const _daysOfWeek = <String>[
  'Понедельник',
  'Вторник',
  'Среда',
  'Четверг',
  'Пятница',
  'Суббота',
  'Воскресенье'
];
