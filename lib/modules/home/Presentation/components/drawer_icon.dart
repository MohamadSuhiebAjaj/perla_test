import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/constants/svg/home_svgs.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    super.key,
    this.close = false,
    this.padding = EdgeInsets.zero,
  });

  final bool close;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: CircleAvatar(
              backgroundColor: AppColors.greyAccent,
              child: RotatedBox(
                  quarterTurns: close ? 1 : 0,
                  child: SvgPicture.asset(HomeSvgs.drawerIcon)),
            ),
            onPressed: () => _drawerAction(context),
          );
        },
      ),
    );
  }

  void _drawerAction(BuildContext context) {
    if (close) {
      context.pop();
      return;
    }
    Scaffold.of(context).openDrawer();
  }
}
