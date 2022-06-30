import 'package:bind/config/repository_config.dart';
import 'package:bind/domain/model/operation_model.dart';
import 'package:bind/domain/repository/operation_history_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_history_state.dart';

class AccountHistoryCubit extends Cubit<AccountHistoryState> {
  AccountHistoryCubit() : super(AccountHistoryInit());

  static final OperationRepository _operationRepository =
      RepositoryConfig.operationRepository();

  Future<void> getOperations() async {
    try {
      emit(AccountHistoryRequested());
      var operations = await _operationRepository.getOperations();
      emit(AccountHistoryReceived(operations));
    } catch (e) {
      emit(AccountHistoryError());
    }
  }
}
