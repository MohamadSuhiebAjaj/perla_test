import 'package:flutter/material.dart';
import 'package:perla_test/core/words/general_words.dart';

import '../constants/durations/app_duration.dart';

// TODO : text theming
void showSnackBar(BuildContext context, String message) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: AppDuration.snackBarDuration,
      action: SnackBarAction(
        label: GeneralsWord.close,
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
    ),
  );
}
