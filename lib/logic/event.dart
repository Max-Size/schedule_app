
import 'package:flutter/material.dart';

class Event{
  final String name;
  final String category;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String place;

  Event({required this.name, required this.category, required this.startTime, required this.endTime,required this.place});

}