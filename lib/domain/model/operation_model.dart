import 'package:bind/domain/model/enum/currency.dart';

class Operation {
  final int id;
  final String name;
  final DateTime date;
  final int sumInCent;
  final Currency currency;

  const Operation({
    required this.id,
    required this.name,
    required this.date,
    required this.sumInCent,
    required this.currency,
  });
}
