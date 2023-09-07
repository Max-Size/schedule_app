import 'package:flutter/material.dart';
import 'package:schedule_app/widgets/event_dialog_widget.dart';
import 'package:schedule_app/widgets/week_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: WeekWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showAdaptiveDialog(
              context: context,
              builder: (BuildContext context) {
                return const EventDialogWidget();
              });
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
