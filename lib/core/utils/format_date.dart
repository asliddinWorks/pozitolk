DateTime parseDateTime(String input) {
  return DateTime.parse(input);
}

String getDateOnly(DateTime? dateTime) {
  if(dateTime == null) return '-';
  return "${dateTime.year.toString().padLeft(4, '0')}"
      "-${dateTime.month.toString().padLeft(2, '0')}"
      "-${dateTime.day.toString().padLeft(2, '0')}";
}

String getDateOnlyDot(DateTime? dateTime) {
  if(dateTime == null) return '-';
  return "${dateTime.day.toString().padLeft(2, '0')}"
      ".${dateTime.month.toString().padLeft(2, '0')}"
    ".${dateTime.year.toString().padLeft(4, '0')}";


}

String getTimeOnly(DateTime? dateTime) {
  if(dateTime == null) return '-';
  return "${dateTime.hour.toString().padLeft(2, '0')}"
      ":${dateTime.minute.toString().padLeft(2, '0')}";
}


String dateDifference(DateTime inputDate) {
  final now = DateTime.now();
  final difference = now.difference(inputDate);

  int years = difference.inDays ~/ 365;
  int months = (difference.inDays % 365) ~/ 30;
  int days = (difference.inDays % 365) % 30;

  String result = '';

  if (years > 0) result += '$years ${years == 1 ? 'год' : 'года'} ';
  if (months > 0) result += '$months мес. ';
  if (days > 0 || result.isEmpty) result += '$days дн.';

  return result.trim();
}


