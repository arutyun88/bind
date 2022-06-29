import 'package:bind/config/api_config.dart';
import 'package:bind/data/repository/operation_data_repository.dart';
import 'package:bind/domain/repository/operation_history_repository.dart';

class RepositoryConfig {
  static OperationRepository? _operationRepository;

  static OperationRepository operationRepository() {
    _operationRepository ??= OperationDataRepository(ApiConfig.api());
    return _operationRepository!;
  }
}