import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_calendar/date_formatter.dart';
import 'package:flutter_calendar/history_tile.dart';
import 'package:http/http.dart' as http;

class History extends StatelessWidget {
  const History(this.selectedDate, {super.key});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    var url = Uri.parse('https://history.muffinlabs.com/date/${selectedDate.month}/${selectedDate.day}');
    var response = http.get(url);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dateFormatted = DateFormatter.toFormattedDate(selectedDate);
            final data = snapshot.data!.body;
            final json = jsonDecode(data) as Map<String, dynamic>;
            final events = json['data']['Events'] as List<dynamic>;
            final displayed = <Map<String, dynamic>>[];
            final rng = Random();
            while (displayed.length < 5) {
              final index = rng.nextInt(events.length);
              displayed.add(events.removeAt(index));
            }
            displayed.sort((a, b) {
              final yearA = a['year'];
              final yearB = b['year'];
              final yearAParsed = _parseYear(yearA);
              final yearBParsed = _parseYear(yearB);
              return yearAParsed.compareTo(yearBParsed);
            });
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Historische Ereignisse am $dateFormatted',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                for (final d in displayed) HistoryTile(event: d),
              ],
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Daten werden geladen',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          );
        },
      ),
    );
  }

  int _parseYear(String yearString) {
    final corrected = yearString.replaceAll(' BC', '');
    return int.parse(corrected);
  }
}
