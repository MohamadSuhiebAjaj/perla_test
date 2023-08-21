import 'package:perla_test/core/words/message_words.dart';

import '../words/general_words.dart';

class AppVaildator {
  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) return GeneralsWord.empty;
    if (!(RegExp(r'^\+?[0-9]{6,}$').hasMatch(value))) {
      return GeneralsWord.invaildPhone;
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) return GeneralsWord.empty;
    if ((value.length < 5)) return GeneralsWord.invaildLength;
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return GeneralsWord.empty;
    if ((value.length < 8)) return GeneralsWord.invaildLength;
    return null;
  }

  static String? matchPassword(String? value1, String value2) {
    if (value1 != value2) return MessageWords.passwordDoesNotMatch;
    return passwordValidator(value1);
  }
}
