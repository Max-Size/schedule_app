import 'package:flutter/widgets.dart';
import 'package:schedule_app/logic/event.dart';

class EventProvider extends InheritedModel{
  final List<Event> mondayEvents;
  final List<Event> tuesdayEvents;
  final List<Event> wednesdayEvents;
  final List<Event> thursdayEvents;
  final List<Event> fridayEvents;
  final List<Event> saturdayEvents;
  final List<Event> sundayEvents;

  const EventProvider({required this.tuesdayEvents, required this.wednesdayEvents, required this.thursdayEvents, required this.fridayEvents, required this.saturdayEvents, required this.sundayEvents, super.key, required super.child, required this.mondayEvents}) ;


  @override
  bool updateShouldNotifyDependent(covariant EventProvider oldWidget, Set dependencies) {
    if(mondayEvents.length != oldWidget.mondayEvents.length && dependencies.contains('monday')){
      return true;
    }
    if(tuesdayEvents.length != oldWidget.tuesdayEvents.length && dependencies.contains('tuesday')){
      return true;
    }
    if(wednesdayEvents.length != oldWidget.wednesdayEvents.length && dependencies.contains('wednesday')){
      return true;
    }
    if(thursdayEvents.length != oldWidget.thursdayEvents.length && dependencies.contains('thursday')){
      return true;
    }
    if(fridayEvents.length != oldWidget.fridayEvents.length && dependencies.contains('friday')){
      return true;
    }
    if(saturdayEvents.length != oldWidget.saturdayEvents.length && dependencies.contains('saturday')){
      return true;
    }
    if(sundayEvents.length != oldWidget.sundayEvents.length && dependencies.contains('sunday')){
      return true;
    }
    return false;
  }
  
  @override
  bool updateShouldNotify(covariant EventProvider oldWidget) {
    return true;
  }

}