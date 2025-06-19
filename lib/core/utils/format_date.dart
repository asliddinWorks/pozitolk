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
