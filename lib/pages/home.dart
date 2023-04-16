import 'package:flutter/material.dart';

import '../classes/widgets.dart';
import '../constants/colors.dart';
import '../provider/calculator_provider.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0XFF58BB7A),
        title: Container(
          margin: const EdgeInsets.all(8.0),
          color: Colors.transparent,
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.entriesBackgroundColor,
          ),
          child: Column(
            children: [
              Expanded(
                child: Consumer<CalculatorProvider>(
                    builder: (context, calculatorProvider, child) {
                  return buildEntries(context, calculatorProvider);
                }),
              ),
              Expanded(
                flex: 2,
                child: buildButtons(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
