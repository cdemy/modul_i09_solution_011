class DateFormatter {
  static String toFormattedDate(DateTime date, [DateFormat format = DateFormat.ddmmyyyy]) {
    final day = date.day.toString();
    final dayPadded = day.padLeft(2, '0');
    final month = date.month.toString();
    final monthPadded = month.padLeft(2, '0');
    final year = date.year.toString();
    final String result;
    switch (format) {
      case DateFormat.ddmmyyyy:
        result = '$dayPadded.$monthPadded.$year';
      case DateFormat.ddmm:
        result = '$dayPadded.$monthPadded.';
      case DateFormat.mmmyyyy:
        result = '${monthGermanOfDate(date)} $year';
    }
    return result;
  }

  static String monthGermanOfDate(DateTime date) => switch (date.month) {
    1 => 'Januar',
    2 => 'Februar',
    3 => 'März',
    4 => 'April',
    5 => 'Mai',
    6 => 'Juni',
    7 => 'Juli',
    8 => 'August',
    9 => 'September',
    10 => 'Oktober',
    11 => 'November',
    12 => 'Dezember',
    _ => throw ArgumentError(),
  };

  static String weekdayGermanOfDate(DateTime date) => switch (date.weekday) {
    1 => 'Montag',
    2 => 'Dienstag',
    3 => 'Mittwoch',
    4 => 'Donnerstag',
    5 => 'Freitag',
    6 => 'Samstag',
    7 => 'Sonntag',
    _ => throw ArgumentError(),
  };
}

enum DateFormat {
  ddmmyyyy,
  ddmm,
  mmmyyyy,
}
