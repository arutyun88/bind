import 'package:bind/config/routes.dart';
import 'package:bind/presentation/account/screen/account_page.dart';
import 'package:bind/presentation/init/screen/init_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const InitPage());
      case Routes.account:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      default:
        return MaterialPageRoute(builder: (_) => const InitPage());
    }
  }
}
