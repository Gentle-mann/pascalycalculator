import 'package:flutter/material.dart';

import '../classes/utility.dart';
import '../model/calculator.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  Calculator calculator = Calculator();

  void appendDigit(String digit) {
    final input = calculator.input == '0' ? digit : calculator.input + digit;
    calculator = calculator.copyWith(input: input);

    notifyListeners();
  }

  void appendOperator(String operator) {
    final input = calculator.input;
    final output = calculator.output;
    // if user divides by 0
    if (output == 'Infinity') {
      resetAll();
      // if user is continuing from an existing output
    } else if (output != '0') {
      final newInput = output;
      final newInputWithAppendedOperator = newInput + operator;
      calculator = calculator.copyWith(input: newInputWithAppendedOperator);
    } else if (Utility.isOperatorAtEnd(input)) {
      final inputWithRemovedEndOperator = input.substring(0, input.length - 1);
      final newInput = inputWithRemovedEndOperator + operator;
      calculator = calculator.copyWith(input: newInput);
    } else if (input == '0') {
      final newInput = operator == '-' ? '-' : '0';
      calculator = calculator.copyWith(input: newInput);
    } else {
      final newInput = input + operator;
      calculator = calculator.copyWith(input: newInput);
    }

    notifyListeners();
  }

  void appendDot() {
    final input = calculator.input;
    //checks if it's mathematically accurate to append dot
    if (Utility.inputContainsDot(input) || Utility.isOperatorAtEnd(input)) {
      return;
    } else {
      final newInput = '$input.';
      calculator = calculator.copyWith(input: newInput);
    }
    notifyListeners();
  }

  void delete() {
    //implement delete last character
    final input = calculator.input;
    if (input.isNotEmpty) {
      if (input != '0') {
        final newInput = input.substring(0, input.length - 1);

        calculator = calculator.copyWith(input: newInput);
      }
    } else {
      resetAll();
    }
    computeOutput();
    notifyListeners();
  }

  void computeOutput() {
    try {
      //perform the calculation
      final expression =
          calculator.input.replaceAll('×', '*').replaceAll('÷', '/');
      final equation = Parser().parse(expression);
      final ContextModel cm = ContextModel();
      final output = '${equation.evaluate(EvaluationType.REAL, cm)}';
      //handle large numbers and decimal places

      if (output.length < 10) {
        //remove '.0' from the end
        if (output.endsWith('.0')) {
          final fomattedOutput = output.substring(0, output.length - 2);
          calculator = calculator.copyWith(output: fomattedOutput);
          //handle normal short decimals
        } else {
          calculator = calculator.copyWith(output: output);
        }
        // handles exponential cases
      } else if (double.parse(output).toStringAsExponential().contains('+')) {
        final newOutput = double.parse(output).toStringAsExponential();
        calculator = calculator.copyWith(output: newOutput);
        // handles large decimal cases
      } else {
        final newOutput =
            double.parse(output).toStringAsExponential().substring(0, 10);
        calculator = calculator.copyWith(output: newOutput);
      }

      notifyListeners();
    } catch (e) {
      return;
    }
  }

  void resetAll() {
    const input = '0';
    const output = '0';
    calculator = calculator.copyWith(input: input, output: output);
    notifyListeners();
  }
}
