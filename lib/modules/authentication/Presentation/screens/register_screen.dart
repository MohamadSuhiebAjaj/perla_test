import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/components/app_text_from_field.dart';
import '../../../../core/components/show_snack_bar.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/vaildator/app_vaildator.dart';
import '../../../../core/words/auth_words.dart';
import '../../../../core/words/message_words.dart';
import '../../../../core/components/app_button.dart';
import '../controllers/register_bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: _registerListener,
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(),
                body: Form(
                  key: formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    children: [
                      // Headers
                      Text(
                        AuthWords.createAccount,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        AuthWords.registerToGetStarted,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),

                      // Full name
                      SizedBox(height: 8.w),
                      Text(
                        AuthWords.fullName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      AppTextFormField(
                        controller: fullNameController,
                        hint: AuthWords.enterYourName,
                        validator: AppVaildator.nameValidator,
                        keyboardType: TextInputType.name,
                        prefixIcon: Icon(
                          Icons.person,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(height: 4.w),

                      // phone number
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

                      // confirm password
                      SizedBox(height: 4.w),
                      Text(
                        AuthWords.confirmPassword,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      AppTextFormField(
                        controller: confirmPasswordController,
                        hint: AuthWords.enterYourPassword,
                        validator: (value1) => AppVaildator.matchPassword(
                          value1,
                          passwordController.text,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        isPass: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(height: 22.w),

                      // button
                      AppButton(
                        lable: AuthWords.register,
                        onTap: () => _registerPressed(context, state),
                      ),

                      // fotter
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AuthWords.aleadyHaveAnAccount,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextButton(
                            onPressed: () => context.go('/login'),
                            child: Text(
                              AuthWords.login,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          )
                        ],
                      ),

                      // loading

                      state is LoadingRegisterState
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

  void _registerPressed(BuildContext context, RegisterState state) {
    if (!(formKey.currentState!.validate()) || state is LoadingRegisterState) {
      return;
    }
    context.read<RegisterBloc>().add(
          RegisterButtonPressedEvent(
            fullName: fullNameController.text,
            password: passwordController.text,
            phoneNumber: phoneNumberController.text,
          ),
        );
  }

  void _registerListener(BuildContext context, RegisterState state) {
    if (state is FailureRegisterState) {
      showSnackBar(context, state.message);
    }

    if (state is SuccessRegisterState) {
      showSnackBar(context, MessageWords.registerSuccessfully);
    }
  }
}
