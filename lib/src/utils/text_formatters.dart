import 'package:flutter/services.dart';

class SortCodeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Format the string as "00-00-00"
    String formattedText = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 2 == 0) {
        formattedText += '-';
      }
      formattedText += digitsOnly[i];
    }

    // Ensure the text doesn't exceed the "00-00-00" pattern
    if (formattedText.length > 8) {
      formattedText = formattedText.substring(0, 8);
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
