import 'package:intl/intl.dart';

class StringUtil {
  static String price(int price) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    return currencyFormatter.format(price);
  }
}