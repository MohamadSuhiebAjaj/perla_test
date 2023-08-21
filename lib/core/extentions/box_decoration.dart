import 'package:flutter/material.dart';

import '../constants/colors/app_colors.dart';

extension AppButtonTheme on ThemeData {
  BoxDecoration get appButtonTheme {
    return BoxDecoration(
      // Customize the decoration properties here
      color: primaryColor,
      borderRadius: BorderRadius.circular(20),
    );
  }

  BoxDecoration get homeHeaderTheme {
    return BoxDecoration(
      // Customize the decoration properties here
      color: AppColors.greyAccent,
      borderRadius: BorderRadius.circular(2),
    );
  }
}
