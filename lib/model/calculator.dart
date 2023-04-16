class Calculator {
  final String input;
  final String output;

  Calculator({
    this.input = '0',
    this.output = '0',
  });

  Calculator copyWith({
    String? input,
    String? output,
  }) {
    return Calculator(
      input: input ?? this.input,
      output: output ?? this.output,
    );
  }
}
