import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/logic/days_of_week.dart';
import 'package:schedule_app/widgets/event_dialog_widget.dart';
import 'package:schedule_app/widgets/week_widget.dart';

import 'logic/storage.dart';

class HomePage extends StatefulWidget {
  final WeekStorage storage;

  const HomePage({Key? key, required this.storage}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppLifecycleListener _listener;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    widget.storage.readFromFile().then((json) => setState(() {
          loading = false;
          DaysOfWeek.fromJson(jsonDecode(json));
        }));
    _listener = AppLifecycleListener(onStateChange: (AppLifecycleState state) {
      switch (state) {
        case AppLifecycleState.paused:
          final json = jsonEncode(DaysOfWeek.toJson());
          widget.storage.writeToFile(json);
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading?
    const CircularProgressIndicator() :
    Scaffold(
      backgroundColor: Colors.blue[100],
      body: WeekWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showAdaptiveDialog(
              context: context,
              builder: (BuildContext context) {
                return const EventDialogWidget();
              });
          setState(() {
            if (kDebugMode) {
              print('set state');
            }
          });
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
