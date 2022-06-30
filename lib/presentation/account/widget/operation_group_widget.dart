import 'package:bind/domain/model/operation_model.dart';
import 'package:bind/presentation/account/widget/operation_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationGroupWidget extends StatelessWidget {
  const OperationGroupWidget({
    Key? key,
    required this.toSize,
    required this.operations,
  }) : super(key: key);

  final Function(double value) toSize;
  final List<Operation> operations;

  @override
  Widget build(BuildContext context) {
    final date = operations.first.date;
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          padding: EdgeInsets.all(toSize(12)),
          child: Text(
            _getDateTitle(date),
            style: TextStyle(fontSize: toSize(14), color: Colors.black),
          ),
        ),
        ...List.generate(
          operations.length,
          (index) => OperationItemWidget(
            toSize: toSize,
            operation: operations[index],
          ),
        )
      ],
    );
  }

  String _getDateTitle(DateTime date) {
    var current = DateTime.now();
    if (date.year == current.year &&
        date.month == current.month &&
        date.day == current.day) {
      return 'Today';
    } else if (date.year == current.year &&
        date.month == current.month &&
        current.day - date.day == 1) {
      return 'Yesterday';
    }
    return DateFormat('EE, MMM dd').format(date);
  }
}
