import 'package:arithmetico/classes/methods.dart';
import 'package:arithmetico/provider/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../widgets/keys_widget.dart';

Widget buildButtons(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: const BoxDecoration(
      color: AppColors.backgroundColor,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24.0),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              buildTopChip('AC', '>', '+/-', context),
              buildDigitsRow('1', '2', '3', context),
              buildDigitsRow('4', '5', '6', context),
              buildDigitsRow('7', '8', '9', context),
              buildDigitsRow('.', '0', '00', context),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: buildOperators('÷', '×', '-', '+', '=', context),
        ),
      ],
    ),
  );
}

Widget buildDigitsRow(String s, String t, String u, BuildContext context) {
  final digits = [s, t, u];
  return Expanded(
    child: Row(
      children: [
        ...digits.map(
          (title) => KeysWidget(
            title: title,
            onClick: () {
              title == '.'
                  ? onDotClicked(context)
                  : onKeyClicked(context, title);
            },
            isOperator: false,
          ),
        ),
      ],
    ),
  );
}

Widget buildTopChip(String s, String t, String u, BuildContext context) {
  final keys = [s, t, u];
  return SizedBox(
    height: 72,
    width: double.infinity,
    child: Card(
      color: AppColors.chipColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48.0),
      ),
      child: Row(
        children: [
          ...keys.map(
            (key) => KeysWidget(
              title: key,
              onClick: () {
                switch (key) {
                  case ('>'):
                    onDeleteKeyClicked(context);
                    break;
                  case ('AC'):
                    onResetKeyClicked(context);
                    break;
                  default:
                    break;
                }
              },
              isOperator: true,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildOperators(
    String s, String t, String u, String v, String w, BuildContext context) {
  final operators = [s, t, u, v, w];

  return SizedBox(
    height: double.infinity,
    width: 24,
    child: Card(
      elevation: 1,
      color: AppColors.chipColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...operators.map(
            (operator) => operator == '='
                ? buildEqualSign(context)
                : KeysWidget(
                    title: operator,
                    onClick: () {
                      onOperatorClicked(context, operator);
                    },
                    isOperator: true,
                  ),
          ),
        ],
      ),
    ),
  );
}

Widget buildEntries(
    BuildContext context, CalculatorProvider calculatorProvider) {
  final output = calculatorProvider.calculator.output;
  final input = calculatorProvider.calculator.input;

  return Container(
    padding: const EdgeInsets.all(36.0),
    decoration: const BoxDecoration(
      gradient: AppColors.entriesBackgroundColor,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              input,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                height: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '=',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              output,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 48,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildEqualSign(BuildContext context) {
  return GestureDetector(
    onTap: () {
      onEqualKeyCliced(context);
    },
    child: Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 100,
      child: Container(
        height: 72,
        width: 72,
        decoration: BoxDecoration(
          gradient: AppColors.equalToColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Center(
          child: Text(
            '=',
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
