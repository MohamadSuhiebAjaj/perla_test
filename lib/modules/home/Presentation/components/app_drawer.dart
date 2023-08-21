import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perla_test/core/words/home_words.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/constants/locale/app_locale.dart';
import '../../../../core/constants/svg/home_svgs.dart';
import '../../../../core/enums/language.dart';
import '../../../../core/storage/storage_handler.dart';
import 'drawer_icon.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(StorageHandler().userName);
    return Drawer(
      child: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 5.w),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: DrawerIcon(
              close: true,
              padding: EdgeInsets.symmetric(vertical: 3.w),
            ),
          ),
          Text(
            StorageHandler().userName ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 15.w),
          _buildThemeComponent(context),
          SizedBox(height: 6.w),
          _buildLangaugeComponent(context),
          SizedBox(height: 6.w),
          _buildLogoutComponent(context),
        ],
      )),
    );
  }

  Widget _buildThemeComponent(BuildContext context) => Row(
        children: [
          SvgPicture.asset(
            HomeSvgs.darkModeIcon,
            width: 7.w,
            height: 7.w,
          ),
          SizedBox(width: 2.w),
          TextButton(
            onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(),
            child: Text(
              HomeWords.darkMode,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      );

  Widget _buildLogoutComponent(BuildContext context) => Row(
        children: [
          SvgPicture.asset(
            HomeSvgs.logoutIcon,
            width: 6.w,
            height: 6.w,
          ),
          SizedBox(width: 3.w),
          TextButton(
            onPressed: () {},
            child: Text(
              HomeWords.logout,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.red),
            ),
          )
        ],
      );
}

Widget _buildLangaugeComponent(BuildContext context) => Row(
      children: [
        SvgPicture.asset(
          HomeSvgs.langIcon,
          width: 6.w,
          height: 6.w,
        ),
        SizedBox(width: 2.w),
        TextButton(
          onPressed: () =>
              AppLocale.changeLangauge(context, AppLanguage.english),
          child: Text(
            HomeWords.arabic,
            style: AppLocale.isArabic(context)
                ? Theme.of(context).textTheme.displaySmall
                : Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Text(
            "/",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        TextButton(
          onPressed: () =>
              AppLocale.changeLangauge(context, AppLanguage.arabic),
          child: Text(
            HomeWords.english,
            style: AppLocale.isEnglish(context)
                ? Theme.of(context).textTheme.displaySmall
                : Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
