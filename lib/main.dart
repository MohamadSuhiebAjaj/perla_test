import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/constants/locale/app_locale.dart';
import 'core/constants/themes/app_theme.dart';
import 'core/pages/routs.dart';
import 'core/services/services_locator.dart';
import 'core/storage/storage_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHandler.init();
  ServicesLocator().init();
  await EasyLocalization.ensureInitialized();

  // StorageHandler().removeToken();
  // StorageHandler().removeUserName();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.supportedLocaless,
      path: 'assets/translations',
      fallbackLocale: AppLocale.english,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Perla test',
          theme: theme,
          darkTheme: darkTheme,
          routerConfig: router,
        ),
      );
    });
  }
}
