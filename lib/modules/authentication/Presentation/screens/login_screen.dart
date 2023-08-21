import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:perla_test/core/components/app_text_from_field.dart';
import 'package:perla_test/core/constants/svg/auth_svgs.dart';
import 'package:perla_test/core/extentions/box_decoration.dart';
import 'package:perla_test/core/vaildator/app_vaildator.dart';
import 'package:perla_test/core/words/message_words.dart';
import 'package:perla_test/core/components/app_button.dart';
import 'package:perla_test/modules/authentication/Presentation/controllers/login_bloc/login_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/components/show_snack_bar.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/words/auth_words.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<LoginBloc>();
      },
      child: BlocListener<LoginBloc, LoginState>(
        listener: _loginListener,
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(),
                body: Form(
                  key: formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    children: [
                      // Header
                      Text(
                        AuthWords.welcomeBack,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        AuthWords.enterYouDataToContinue,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),

                      // phone number
                      SizedBox(height: 8.w),
                      Text(
                        AuthWords.phoneNumber,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      AppTextFormField(
                        controller: phoneNumberController,
                        hint: AuthWords.enterYourPhoneNumber,
                        validator: AppVaildator.phoneValidator,
                        keyboardType: TextInputType.phone,
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 18.sp,
                        ),
                      ),

                      // password
                      SizedBox(height: 4.w),
                      Text(
                        AuthWords.password,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      AppTextFormField(
                        controller: passwordController,
                        hint: AuthWords.enterYourPassword,
                        validator: AppVaildator.passwordValidator,
                        keyboardType: TextInputType.visiblePassword,
                        isPass: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(height: 60.w),

                      // button
                      AppButton(
                        lable: AuthWords.login,
                        onTap: () => _loginPressed(context, state),
                      ),

                      // fotter
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AuthWords.dontHaveAnAccount,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextButton(
                              onPressed: () {
                                context.go('/register');
                              },
                              child: Text(
                                AuthWords.register,
                                style: Theme.of(context).textTheme.displaySmall,
                              ))
                        ],
                      ),

                      // loading
                      state is LoadingLoginState
                          ? LoadingAnimationWidget.inkDrop(
                              color: Theme.of(context).primaryColor,
                              size: 18.sp,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }

  void _loginPressed(BuildContext context, LoginState state) {
    if (!(formKey.currentState!.validate()) || state is LoadingLoginState) {
      return;
    }
    context.read<LoginBloc>().add(
          LoginButtonPressedEvent(
              password: passwordController.text,
              phoneNumber: phoneNumberController.text),
        );
  }

  void _loginListener(BuildContext context, LoginState state) {
    if (state is FailureLoginState) {
      showSnackBar(context, state.message);
    }

    if (state is SuccessLoginState) {
      context.go('/home');
      showSnackBar(context, MessageWords.loginSuccessfully);
    }
  }
}
