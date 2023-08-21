import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../enums/language.dart';

class AppLocale {
  static const Locale arabic = Locale('ar', "SY");
  static const Locale english = Locale('en', "US");

  static AppLanguage currentLanguage(BuildContext context) {
    if (context.locale == arabic) return AppLanguage.arabic;
    return AppLanguage.english;
  }

  static List<Locale> get supportedLocaless => [english, arabic];
  static void changeLangauge(BuildContext context, AppLanguage to) {
    Locale newLocal = context.locale;
    final current = currentLanguage(context);
    if (current != to) return;

    switch (current) {
      case AppLanguage.arabic:
        newLocal = english;
        break;
      case AppLanguage.english:
        newLocal = arabic;
        break;
    }
    context.setLocale(newLocal);
  }

  static bool isEnglish(BuildContext context) =>
      currentLanguage(context) == AppLanguage.english;

  static bool isArabic(BuildContext context) =>
      currentLanguage(context) == AppLanguage.arabic;
}
