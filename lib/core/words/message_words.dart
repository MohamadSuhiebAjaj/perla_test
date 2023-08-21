import 'package:easy_localization/easy_localization.dart';

class MessageWords {
  static String get error => "An unexpected error occurred, try again later".tr();
  static String get loginSuccessfully => "Login completed successfully".tr();
  static String get registerSuccessfully => "Register completed successfully".tr();
  static String get passwordDoesNotMatch => "Password does not match".tr();
  static String get noInternet =>
      'There is no internet connection or connection problems, try again later'.tr();
}
