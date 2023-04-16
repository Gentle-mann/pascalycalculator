import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/calculator_provider.dart';

void onKeyClicked(BuildContext context, String key) {
  final calculatorProvider =
      Provider.of<CalculatorProvider>(context, listen: false);
  calculatorProvider.appendDigit(key);
}

void onOperatorClicked(BuildContext context, String operator) {
  final calculatorProvider =
      Provider.of<CalculatorProvider>(context, listen: false);
  calculatorProvider.appendOperator(operator);
}

void onDotClicked(BuildContext context) {
  final calculatorProvider =
      Provider.of<CalculatorProvider>(context, listen: false);
  calculatorProvider.appendDot();
}

void onEqualKeyCliced(BuildContext context) {
  final calculatorProvider =
      Provider.of<CalculatorProvider>(context, listen: false);
  calculatorProvider.computeOutput();
}

void onDeleteKeyClicked(BuildContext context) {
  final calculatorProvider =
      Provider.of<CalculatorProvider>(context, listen: false);
  calculatorProvider.delete();
}

void onResetKeyClicked(BuildContext context) {
  final calculatorProvider =
      Provider.of<CalculatorProvider>(context, listen: false);
  calculatorProvider.resetAll();
}
