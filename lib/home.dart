import 'package:flutter/material.dart';
import 'package:flutter_calendar/calendar_sheet.dart';
import 'package:flutter_calendar/date_formatter.dart';
import 'package:flutter_calendar/history.dart';
import 'package:flutter_calendar/info_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now().toUtc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Kalenderblatt vom ${DateFormatter.toFormattedDate(selectedDate)}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InfoBox(selectedDate),
          CalendarSheet(
            selectedDate: selectedDate,
            onSelectDate: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          History(
            selectedDate,
            key: Key(
              selectedDate.toIso8601String(),
            ),
          ),
        ],
      ),
    );
  }
}
