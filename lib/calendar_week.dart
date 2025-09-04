import 'package:flutter/material.dart';
import 'package:flutter_calendar/calendar_day.dart' show CalendarDay;

class CalendarWeek extends StatelessWidget {
  const CalendarWeek({
    required this.weekStart,
    required this.selectedMonth,
    required this.selectedDate,
    required this.onSelectDate,
    super.key,
  });

  final DateTime weekStart;
  final DateTime selectedMonth;
  final DateTime selectedDate;
  final void Function(DateTime) onSelectDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 7; i++)
          Expanded(
            child: CalendarDay(
              day: DateTime.utc(weekStart.year, weekStart.month, weekStart.day + i),
              selectedMonth: selectedMonth,
              selectedDate: selectedDate,
              onSelectDate: onSelectDate,
            ),
          ),
      ],
    );
  }
}
