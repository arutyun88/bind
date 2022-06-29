import 'package:bind/domain/model/operation_model.dart';

abstract class OperationRepository {
  Future<List<Operation>> getOperations();
}
