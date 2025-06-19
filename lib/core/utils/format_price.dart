import 'package:intl/intl.dart';

String formatPrice(int number) {
  final formatter = NumberFormat('#,###', 'ru'); // 'ru' — bu rus tilidagi format: " " bo‘sh joy ajratadi
  return formatter.format(number);
}