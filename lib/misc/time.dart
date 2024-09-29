bool areTimestampsOnSameDay(int timestamp1, int timestamp2) {
  final dateTime1 = DateTime.fromMillisecondsSinceEpoch(timestamp1);
  final dateTime2 = DateTime.fromMillisecondsSinceEpoch(timestamp2);

  return dateTime1.year == dateTime2.year &&
      dateTime1.month == dateTime2.month &&
      dateTime1.day == dateTime2.day;
}

bool isTimestampToday(int timestamp) {
  return areTimestampsOnSameDay(
    timestamp,
    DateTime.now().millisecondsSinceEpoch,
  );
}
