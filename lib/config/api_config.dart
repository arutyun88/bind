import 'package:bind/data/api.dart';
import 'package:bind/data/api/account_history_api.dart';

class ApiConfig {
  static Api? _api;

  static Api api() {
    _api ??= Api(AccountHistoryApi());
    return _api!;
  }
}
