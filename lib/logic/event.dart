
import 'package:flutter/material.dart';

class Event{
  final String name;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String place;

  Event({required this.name, required this.startTime, required this.endTime,required this.place});

  Map<String,dynamic> toJson() => {
    "name":name,
    "place":place,
    "startTime": "${startTime.hour}:${startTime.minute}",
    "endTime": "${endTime.hour}:${endTime.minute}"
  };

  factory Event.fromJson(Map<String,dynamic> json){
    String name = json["name"];
    String place = json["place"];
    int startTimeHour = int.parse(json["startTime"].split(":")[0]);
    int startTimeMinute = int.parse(json["startTime"].split(":")[1]);
    var startTime = TimeOfDay(hour: startTimeHour, minute: startTimeMinute);
    int endTimeHour = int.parse(json["endTime"].split(":")[0]);
    int endTimeMinute = int.parse(json["endTime"].split(":")[1]);
    var endTime = TimeOfDay(hour: endTimeHour, minute: endTimeMinute);
    return Event(name: name, startTime: startTime, endTime: endTime, place: place);
  }
}