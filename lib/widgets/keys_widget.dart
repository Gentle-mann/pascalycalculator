import 'package:flutter/material.dart';

class KeysWidget extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  final bool isOperator;
  const KeysWidget({
    super.key,
    required this.title,
    required this.onClick,
    required this.isOperator,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      fontWeight: FontWeight.bold,
      color: isOperator ? Colors.green : Colors.white,
      fontSize: isOperator ? 28 : 24,
    );
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          child: title == '>'
              ? const Icon(Icons.backspace_outlined, color: Colors.green)
              : Text(title, style: style),
        ),
      ),
    );
  }
}
