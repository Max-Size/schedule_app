import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schedule_app/home_page.dart';
import 'package:schedule_app/logic/storage.dart';

import 'logic/days_of_week.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(storage: WeekStorage(),),
    );
  }
}
