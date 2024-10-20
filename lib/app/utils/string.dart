import 'package:intl/intl.dart';

class StringUtil {
  static String price(int price) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    return currencyFormatter.format(price);
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
