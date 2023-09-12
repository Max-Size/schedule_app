import 'dart:convert';
import 'dart:io';

import 'package:schedule_app/widgets/event_widget.dart';

import 'event.dart';

abstract class DaysOfWeek{

  static final mondayEvents = <Event>[];
  static final tuesdayEvents = <Event>[];
  static final wednesdayEvents = <Event>[];
  static final thursdayEvents = <Event>[];
  static final fridayEvents = <Event>[];
  static final saturdayEvents = <Event>[];
  static final sundayEvents = <Event>[];
  static void addMondayEvent(Event event) => mondayEvents.add(event);
  static void addTuesdayEvent(Event event) => tuesdayEvents.add(event);
  static void addWednesdayEvent(Event event) => wednesdayEvents.add(event);
  static void addThursdayEvent(Event event) => thursdayEvents.add(event);
  static void addFridayEvent(Event event) => fridayEvents.add(event);
  static void addSaturdayEvent(Event event) => mondayEvents.add(event);
  static void addSundayEvent(Event event) => sundayEvents.add(event);

  static Map<String,dynamic> toJson() => {
    "monday": mondayEvents,
    "tuesday": tuesdayEvents,
    "wednesday": wednesdayEvents,
    "thursday": thursdayEvents,
    "friday": fridayEvents,
    "saturday": saturdayEvents,
    "sunday": sundayEvents
  };

  static void fromJson(Map<String,dynamic> json){
    json["monday"]?.forEach((element) => mondayEvents.add(Event.fromJson(element)));
    json["tuesday"]?.forEach((element) => tuesdayEvents.add(Event.fromJson(element)));
    json["wednesday"]?.forEach((element) => wednesdayEvents.add(Event.fromJson(element)));
    json["thursday"]?.forEach((element) => thursdayEvents.add(Event.fromJson(element)));
    json["friday"]?.forEach((element) => fridayEvents.add(Event.fromJson(element)));
    json["saturday"]?.forEach((element) => saturdayEvents.add(Event.fromJson(element)));
    json["sunday"]?.forEach((element) => sundayEvents.add(Event.fromJson(element)));
  }

}

