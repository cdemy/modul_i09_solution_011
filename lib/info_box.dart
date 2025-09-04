import 'package:flutter/material.dart';
import 'package:flutter_calendar/date_formatter.dart';
import 'package:flutter_calendar/date_helper.dart';

class InfoBox extends StatelessWidget {
  const InfoBox(this.selectedDate, {super.key});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    final date = DateFormatter.toFormattedDate(selectedDate);
    final weekday = DateFormatter.weekdayGermanOfDate(selectedDate);
    final howmany = (selectedDate.day / 7).ceil();
    final month = DateFormatter.monthGermanOfDate(selectedDate);
    final year = selectedDate.year;
    final feiertag = DateHelper.getFeiertagOfDate(selectedDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Der $date ist ein $weekday und zwar der $howmany $weekday im Monat $month des Jahres $year.'),
        ),
        if (feiertag != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Heute ist ein gesetzlicher Feiertag, nämlich $feiertag.'),
          ),
        if (feiertag == null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Heute ist kein gesetzlicher Feiertag.'),
          ),
      ],
    );
  }
}
