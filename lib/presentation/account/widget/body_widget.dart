import 'package:bind/domain/model/operation_model.dart';
import 'package:bind/domain/state/account/account_history_cubit.dart';
import 'package:bind/presentation/account/widget/operation_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    Key? key,
    required this.toSize,
  }) : super(key: key);

  final Function(double value) toSize;

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  void initState() {
    super.initState();
    context.read<AccountHistoryCubit>().getOperations();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: BlocBuilder<AccountHistoryCubit, AccountHistoryState>(
          builder: (context, state) {
            if (state is AccountHistoryRequested) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AccountHistoryReceived) {
              Map<DateTime, List<Operation>> maps = _getMaps(state.operations);
              return Column(
                children: List.generate(
                  maps.length,
                  (index) => OperationGroupWidget(
                    toSize: widget.toSize,
                    operations: maps.values.map((e) => e).toList()[index],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'Ошибка получения данных',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Map<DateTime, List<Operation>> _getMaps(List<Operation> operations) {
    operations.sort((a, b) => a.date.isBefore(b.date) ? 1 : 0);
    Map<DateTime, List<Operation>> map = {};
    for (var element in operations) {
      if (!map.containsKey(element.date)) {
        map.putIfAbsent(element.date, () => [element]);
      } else {
        for (var entry in map.entries) {
          if (entry.key == element.date) {
            entry.value.add(element);
          }
        }
      }
    }
    return map;
  }
}
