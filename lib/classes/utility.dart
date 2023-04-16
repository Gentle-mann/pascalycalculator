class Utility {
  static bool isOperatorAtEnd(String input) {
    final List<String> operators = ['÷', '×', '-', '+', '.'];
    if (input.isNotEmpty) {
      return operators.contains(input.substring(input.length - 1));
    } else {
      return false;
    }
  }

// This method is currently not very effective.
// I need it to return true even for some instances where input contains a dot.
  static bool inputContainsDot(String input) {
    if (input.isNotEmpty) {
      return input.contains('.');
    } else {
      return false;
    }
  }
  // This, I'll find a way to implement
  // static bool containsAndCanAppendDot() {

  // }
}
