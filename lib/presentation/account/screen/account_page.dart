import 'package:bind/domain/state/account/account_history_cubit.dart';
import 'package:bind/presentation/account/widget/body_widget.dart';
import 'package:bind/presentation/account/widget/header_widget.dart';
import 'package:bind/presentation/account/widget/setting_widget.dart';
import 'package:bind/presentation/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function(double) toSize = realSize(context);
    return BlocProvider(
      create: (_) => AccountHistoryCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: CupertinoButton(
                  child: const Icon(Icons.west_sharp, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  CupertinoButton(
                    child:
                        const Icon(CupertinoIcons.share, color: Colors.white),
                    onPressed: () {},
                  )
                ],
                floating: true,
                snap: true,
                backgroundColor: Colors.black.withOpacity(.9),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    HeaderWidget(toSize: toSize),
                    SettingWidget(toSize: toSize),
                    Flexible(child: BodyWidget(toSize: toSize)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
