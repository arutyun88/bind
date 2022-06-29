import 'package:bind/data/api/account_history_api.dart';
import 'package:bind/data/mapper/operation_mapper.dart';
import 'package:bind/domain/model/operation_model.dart';

class Api {
  final AccountHistoryApi _accountHistoryApi;

  const Api(this._accountHistoryApi);

  Future<List<Operation>> getOperations() async {
    final apiOperations = await _accountHistoryApi.getHistory();
    return apiOperations
        .map((operation) => OperationMapper.fromApi(operation))
        .toList();
  }
}
