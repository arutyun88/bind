import 'package:bind/domain/model/operation_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationItemWidget extends StatelessWidget {
  const OperationItemWidget({
    Key? key,
    required this.toSize,
    required this.operation,
  }) : super(key: key);

  final Function(double value) toSize;
  final Operation operation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(toSize(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: toSize(12)),
            child: Container(
              height: toSize(36),
              width: toSize(36),
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  operation.name,
                  style: TextStyle(fontSize: toSize(16), color: Colors.black),
                ),
                SizedBox(height: toSize(10)),
                Text(
                  DateFormat('hh:mm').format(operation.date),
                  style: TextStyle(fontSize: toSize(10), color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: toSize(4)),
            child: Text(
              '- \$${operation.sumInCent / 100} USD',
              style: TextStyle(
                fontSize: toSize(14),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
