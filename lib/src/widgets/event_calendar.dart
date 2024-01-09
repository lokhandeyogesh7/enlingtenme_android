import 'package:enlightenme/src/config/utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventCalendarWidget extends StatefulWidget {
  const EventCalendarWidget({Key? key}) : super(key: key);

  @override
  State<EventCalendarWidget> createState() => _EventCalendarWidgetState();
}

class _EventCalendarWidgetState extends State<EventCalendarWidget> {
  var calenderView = CalendarView.day;

  void handleClick(String value) {
    switch (value) {
      case 'View Day':
        setState(() {
          calenderView = CalendarView.day;
        });
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('????? build called is $calenderView');
    return Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
      allowedViews: const [
        CalendarView.day,
        CalendarView.week,
        CalendarView.workWeek,
        CalendarView.month,
        CalendarView.timelineDay,
        CalendarView.timelineWeek,
        CalendarView.timelineWorkWeek
      ],
      dataSource: MeetingDataSource(_getDataSource()),
      // by default the month appointment display mode set as Indicator, we can
      // change the display mode as appointment using the appointment display
      // mode property
      onTap: (calendarTapDetails) {
        print('calendaer details ${calendarTapDetails.appointments}');
        print('calendaer details ${calendarTapDetails.date}');
        print('calendaer details ${calendarTapDetails.resource}');
        print('calendaer details ${calendarTapDetails.targetElement}');
        dynamic appointment = calendarTapDetails.appointments;
        DateTime date = calendarTapDetails.date!;
        CalendarElement element = calendarTapDetails.targetElement;
        // print('element is ${(appointment[0] as Meeting).eventName}');
        print('element is ${appointment.toString() == "[]"}');

        if (appointment.toString() == "[]") {
          Navigator.pushNamed(context, Utils.createEvent);
        } else
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text((appointment[0] as Meeting).eventName),
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok")),
              ],
            ),
          );
      },
      monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(days: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    meetings.add(Meeting(
        "Web Development Class",
        DateTime(today.year, today.month, 15, 9),
        DateTime(today.year, today.month, 15, 9),
        Colors.red,
        false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
