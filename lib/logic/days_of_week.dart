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

}

