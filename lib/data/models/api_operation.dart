import 'package:bind/data/models/enum/api_currency.dart';
import 'package:json_annotation/json_annotation.dart';

class ApiOperation {
  final int id;
  final String name;
  final DateTime date;
  final int sumInCent;
  final ApiCurrency currency;

  ApiOperation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        date = DateTime.parse(json['date']).toLocal(),
        sumInCent = json['sumInCent'],
        currency = $enumDecode(currencyValues, json['currency']);

  @override
  String toString() {
    return 'Operation{id: $id, name: $name, date: $date, sumInCent: $sumInCent, currency: $currency}';
  }
}
