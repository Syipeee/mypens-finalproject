class LogbookConstants {
  static const List<String> daysOfWeek = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat'
  ];

  static List<String> statusHari = List.filled(daysOfWeek.length, 'empty');
}

class DateRange {
  final DateTime startDate;
  final DateTime endDate;

  DateRange(this.startDate, this.endDate);
}
