import 'package:intl/intl.dart';

class DataFormater {
  static String formatDate(DateTime dateTime) =>
      DateFormat('d MMM, yyyy').format(dateTime);
}
