


class DateUtils{
  static formateDate(timestamp){
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.year}年${date.month}月${date.day}日';
  }
}