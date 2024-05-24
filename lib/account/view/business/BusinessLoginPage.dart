import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sari/utils/theme/colors.dart';
import 'package:sari/utils/theme/typography.dart';
import 'package:sari/widgets/form/AppForm.dart';

class LoginPage extends StatefulWidget {
  final dynamic message;
  const LoginPage({super.key, required this.message});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isErrorUsername = false;
  bool isErrorPassword = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    isPasswordVisible = false;
  }

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
                  controller: usernameController,
                  textInputAction: TextInputAction.next,
                  decoration: AppForm.whiteField.copyWith(
                    labelText: 'Username',
                    errorText:
                        isErrorUsername ? 'Username cannot be empty' : null,
                  )),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                textInputAction: TextInputAction.done,
                obscuringCharacter: '*',
                decoration: AppForm.whiteField.copyWith(
                  labelText: 'Password',
                  errorText:
                      isErrorPassword ? 'Password cannot be empty' : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                      onPressed: () async {
                        isErrorUsername = usernameController.text.isEmpty;
                        isErrorPassword = passwordController.text.isEmpty;

                        if (isErrorUsername || isErrorPassword) {
                          setState(() {});
                          return;
                        } else {
                          await GoRouter.of(context).pushReplacement('/loading',
                              extra: {
                                'username': usernameController.text,
                                'password': passwordController.text,
                                'fromPage': 'login'
                              });
                        }
                      },
                      style: AppForm.darkButton,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: AppColors.dirtyWhite),
                      ))),
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
