import 'package:flutter/material.dart';

Function(double) realSize(BuildContext context) {
  double percent = 1 / 374 * MediaQuery.of(context).size.width;

  return (double value) {
    return value * percent;
  };
}
