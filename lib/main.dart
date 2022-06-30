import 'package:bind/config/app_router.dart';
import 'package:bind/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.home,
    );
  }
}
