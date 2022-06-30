part of 'account_history_cubit.dart';

abstract class AccountHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccountHistoryInit extends AccountHistoryState {}

class AccountHistoryRequested extends AccountHistoryState {}

class AccountHistoryReceived extends AccountHistoryState {
  final List<Operation> operations;

  AccountHistoryReceived(this.operations);

  @override
  List<Object?> get props => [operations];
}

class AccountHistoryError extends AccountHistoryState {}
