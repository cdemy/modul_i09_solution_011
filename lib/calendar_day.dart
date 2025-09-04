import 'package:flutter/material.dart';
import 'package:flutter_calendar/date_helper.dart';

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    required this.day,
    required this.selectedMonth,
    required this.selectedDate,
    required this.onSelectDate,
    super.key,
  });

  final DateTime day;
  final DateTime selectedMonth;
  final DateTime selectedDate;
  final void Function(DateTime) onSelectDate;

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    return InkWell(
      onTap: () {
        onSelectDate(day);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(),
            top: BorderSide(),
            right: day.weekday == 7 ? BorderSide() : BorderSide.none,
          ),
          color: color,
        ),
        child: Text(
          '${day.day}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Color _getColor() {
    if (day.month != selectedMonth.month) return Colors.grey;
    if (_areDatesEqual(day, selectedDate)) return Colors.orange;
    if (_areDatesEqual(day, DateTime.now().toUtc())) return Colors.yellow;
    if (day.weekday == 6) return Colors.blue[100]!;
    if (day.weekday == 7) return Colors.red[100]!;
    if (DateHelper.getFeiertagOfDate(day) != null) return Colors.red[300]!;
    return Colors.transparent;
  }

  bool _areDatesEqual(DateTime a, DateTime b) {
    if (a.year != b.year) return false;
    if (a.month != b.month) return false;
    if (a.day != b.day) return false;
    return true;
  }
}
