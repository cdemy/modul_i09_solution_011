class DateHelper {
  static Map<String, String> getFeiertagMap(DateTime date) {
    final year = date.year.toString();
    return {
      '${year}0101': 'Neujahr',
      '${year}0501': 'Tag der Arbeit',
      '${year}1003': 'Tag der Deutschen Einheit',
      '${year}1225': 'Erster Weihnachtstag',
      '${year}1226': 'Zweiter Weihnachtstag',
    };
  }

  static String? getFeiertagOfDate(DateTime date) {
    final day = date.day.toString();
    final dayPadded = day.padLeft(2, '0');
    final month = date.month.toString();
    final monthPadded = month.padLeft(2, '0');
    final year = date.year.toString();
    final result = getFeiertagMap(
      date,
    )['$year$monthPadded$dayPadded'];
    return result;
  }
}
