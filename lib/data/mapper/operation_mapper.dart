import 'package:bind/data/models/api_operation.dart';
import 'package:bind/data/models/enum/api_currency.dart';
import 'package:bind/domain/model/operation_model.dart';

class OperationMapper {
  static Operation fromApi(ApiOperation operation) => Operation(
        id: operation.id,
        name: operation.name,
        date: operation.date,
        sumInCent: operation.sumInCent,
        currency: mapCurrency(operation.currency),
      );
}
