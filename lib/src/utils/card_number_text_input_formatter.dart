import 'package:flutter/services.dart';

class CardNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Format the string as "00-00-00"
    String formattedText = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formattedText += '-';
      }
      formattedText += digitsOnly[i];
    }

    // Ensure the text doesn't exceed the "00-00-00" pattern
    if (formattedText.length > 19) {
      formattedText = formattedText.substring(0, 19);
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
