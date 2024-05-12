import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sari/utils/theme/colors.dart';
import 'package:sari/utils/theme/typography.dart';

import '../../widgets/form/textfield.dart';

class RegisterBusinessAcc extends StatefulWidget {
  const RegisterBusinessAcc({super.key});

  @override
  State<RegisterBusinessAcc> createState() => _RegisterBusinessAccState();
}

class _RegisterBusinessAccState extends State<RegisterBusinessAcc> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.01,),
              Center(
                child: Text(
                  'Sari',
                  style: TextStyle(
                    fontSize: screenSize.height * 0.06,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02,),
              const Text('Register', style: AppTypography.heading1),
              const Text('Create your business account.',
                  style: AppTypography.bodyText),
              SizedBox(height: screenSize.height * 0.02,),
              TextField(
                controller: username,
                decoration: AppForm.whiteField.copyWith(labelText: 'Username'),
              ),
              SizedBox(height: screenSize.height * 0.02,),
              TextField(
                controller: email,
                decoration: AppForm.whiteField.copyWith(labelText: 'Email'),
              ),
              SizedBox(height: screenSize.height * 0.02,),
              TextField(
                controller: password,
                obscureText: true,
                decoration: AppForm.whiteField.copyWith(labelText: 'Password'),
              ),
              SizedBox(height: screenSize.height * 0.02,),
              TextField(
                controller: confirmPassword,
                obscureText: true,
                decoration: AppForm.whiteField.copyWith(labelText: 'Confirm Password'),
              ),
              SizedBox(height: screenSize.height * 0.02,),
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                    onPressed: () {},
                    style: AppForm.darkButton,
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(color: AppColors.dirtyWhite),
                    )),
              ),
              SizedBox(height: screenSize.height * 0.075,),
              Center(
                child: Text.rich(TextSpan(
                    text: 'Already have an account? ',
                    style: AppTypography.bodyText,
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: AppTypography.bodyText.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(context).go('/business/login');
                          },
                      )
                    ])),
              )
            ],
          ),
        )
      )
    );
  }
}
