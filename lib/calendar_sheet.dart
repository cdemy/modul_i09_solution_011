import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_calendar/calendar_week.dart';
import 'package:flutter_calendar/date_formatter.dart';

class CalendarSheet extends StatefulWidget {
  const CalendarSheet({
    required this.selectedDate,
    required this.onSelectDate,
    super.key,
  });

  final DateTime selectedDate;
  final void Function(DateTime) onSelectDate;

  @override
  State<CalendarSheet> createState() => _CalendarSheetState();
}

class _CalendarSheetState extends State<CalendarSheet> {
  DateTime selectedMonth = DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  @override
  Widget build(BuildContext context) {
    final month = DateFormatter.toFormattedDate(selectedMonth, DateFormat.mmmyyyy);
    final firstDay = DateTime.utc(selectedMonth.year, selectedMonth.month, 2 - selectedMonth.weekday);
    log('firstDay: $firstDay');
    final lastDayOfMonth = DateTime.utc(selectedMonth.year, selectedMonth.month + 1, 0);
    final lastDay = DateTime.utc(selectedMonth.year, selectedMonth.month + 1, 7 - lastDayOfMonth.weekday);
    log('lastDay: $lastDay');

    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedMonth = DateTime.utc(selectedMonth.year, selectedMonth.month - 1, 1);
                });
              },
              icon: Icon(Icons.arrow_left),
            ),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                month,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedMonth = DateTime.utc(selectedMonth.year, selectedMonth.month + 1, 1);
                });
              },
              icon: Icon(Icons.arrow_right),
            ),
            SizedBox(width: 20),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide())),
            child: Column(
              children: [
                for (var w = firstDay; w.isBefore(lastDay); w = w.add(Duration(days: 7)))
                  CalendarWeek(
                    weekStart: w,
                    selectedMonth: selectedMonth,
                    selectedDate: widget.selectedDate,
                    onSelectDate: widget.onSelectDate,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
