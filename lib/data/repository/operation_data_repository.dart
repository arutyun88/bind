import 'package:bind/data/api.dart';
import 'package:bind/domain/model/operation_model.dart';
import 'package:bind/domain/repository/operation_history_repository.dart';

class OperationDataRepository extends OperationRepository {
  final Api _api;

  OperationDataRepository(this._api);

  @override
  Future<List<Operation>> getOperations() async {
    return await _api.getOperations();
  }
}
