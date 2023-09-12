import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/logic/days_of_week.dart';
import 'package:schedule_app/widgets/event_dialog_widget.dart';
import 'package:schedule_app/widgets/week_widget.dart';

import 'logic/event.dart';
import 'logic/storage.dart';

class HomePage extends StatefulWidget {
  final WeekStorage storage;

  const HomePage({Key? key, required this.storage}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    widget.storage.readFromFile().then((json) => setState(() {
          if (kDebugMode) {
            print(json);
          }
          DaysOfWeek.fromJson(jsonDecode(json));
        }));
    _listener = AppLifecycleListener(onStateChange: (AppLifecycleState state) {
      switch (state) {
        case AppLifecycleState.detached:
          print('detached');
          final json = jsonEncode(DaysOfWeek.toJson());
          widget.storage.writeToFile(json);
        case AppLifecycleState.resumed:
          print('resumed');
        case AppLifecycleState.inactive:
          print('inactive');
        case AppLifecycleState.hidden:
          print('hidden');
        case AppLifecycleState.paused:
          print('paused');
          final json = jsonEncode(DaysOfWeek.toJson());
          widget.storage.writeToFile(json);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(jsonEncode(Event(
              name: 'dfdf',
              startTime: TimeOfDay.now(),
              endTime: TimeOfDay.now(),
              place: 'ererer')
          .toJson()));
    }
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: WeekWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showAdaptiveDialog(
              context: context,
              builder: (BuildContext context) {
                return const EventDialogWidget();
              });
          //final json = jsonEncode(DaysOfWeek.toJson());
          //widget.storage.writeToFile(json);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    final json = jsonEncode(DaysOfWeek.toJson());
    widget.storage.writeToFile(json);
    super.dispose();
  }
}
