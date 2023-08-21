// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:perla_test/core/extentions/box_decoration.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.lable,
    required this.onTap,
    this.margin,
  }) : super(key: key);

  final String lable;
  final VoidCallback onTap;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 14.w,
        margin: margin,
        decoration: Theme.of(context).appButtonTheme,
        alignment: Alignment.center,
        child: Text(
          lable,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
