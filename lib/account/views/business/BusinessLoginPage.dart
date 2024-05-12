import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sari/utils/theme/colors.dart';
import 'package:sari/utils/theme/typography.dart';
import 'package:sari/widgets/form/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Center(
                child: Text(
                  'Sari',
                  style: TextStyle(
                      fontSize: screenSize.height * 0.10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              const Text('Login', style: AppTypography.heading1),
              const Text('Sign in your business account.',
                  style: AppTypography.bodyText),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              TextField(
                  controller: username,
                  decoration: AppForm.whiteField.copyWith(
                    labelText: 'Username',
                  )),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              TextField(
                  controller: password,
                  obscureText: true,
                  decoration: AppForm.whiteField.copyWith(
                    labelText: 'Password',
                  )),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pushReplacement('/profile/list');
                    },
                    style: AppForm.darkButton,
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(color: AppColors.dirtyWhite),
                    )),
              ),
              SizedBox(
                height: screenSize.height * 0.20,
              ),
              Center(
                child: Text.rich(TextSpan(
                    text: 'Don’t have an account? ',
                    style: AppTypography.bodyText,
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: AppTypography.bodyText.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(context).push('/business/register');
                          },
                      )
                    ])),
              )

            ],
          ),
        ),
      ),
    );
  }
}
