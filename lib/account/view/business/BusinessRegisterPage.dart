import 'dart:async';
import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:sari/utils/env.dart';
import 'package:sari/utils/theme/colors.dart';
import 'package:sari/utils/theme/typography.dart';
import 'package:http/http.dart' as http;

import '../../../token/services/token.dart';
import '../../../widgets/form/AppForm.dart';

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
  bool isErrorUsername = false;
  bool isErrorEmail = false;
  bool isErrorPassword = false;
  bool isErrorConfirmPassword = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;
  String? errorConfirmPassword;
  String? errorPassword;
  List<String> suggestions = [];
  late Object response;
  Timer? _debounceUsername;
  Timer? _debounceEmail;

  String? _errorMessage;
  String? _errorMessageEmail;

  @override
  void initState() {
    super.initState();
    username.addListener(_onUsernameChanged);
    email.addListener(_onEmailChanged);
    password.addListener(_onPasswordChanged);
    confirmPassword.addListener(_onConfirmPasswordChanged);
  }

  // @override
  // void dispose() {
  //   _debounceUsername?.cancel();
  //   _debounceEmail?.cancel();
  //   username.dispose();
  //   email.dispose();
  //   super.dispose();
  // }

  void _onPasswordChanged() {
    setState(() {
      errorPassword = null;
    });
  }

  void _onConfirmPasswordChanged() {
    setState(() {
      errorConfirmPassword = null;
    });
  }

  void _onUsernameChanged() {
    if (username.text.length < 4) {
      setState(() {
        _errorMessage = null; // Clear error message if less than 4 characters
      });
      return;
    }

    if (_debounceUsername?.isActive ?? false) _debounceUsername!.cancel();
    _debounceUsername = Timer(const Duration(milliseconds: 500), () {
      _checkUsername(username.text);
    });
  }

  void _onEmailChanged() {
    if (email.text.length < 4 || !email.text.contains('@')) {
      setState(() {
        _errorMessage = null; // Clear error message if less than 4 characters
      });
      return;
    }

    if (_debounceEmail?.isActive ?? false) _debounceEmail!.cancel();
    _debounceEmail = Timer(const Duration(milliseconds: 500), () {
      _checkEmail(email.text);
    });
  }

  Future<void> _checkUsername(String username) async {
    String token = await getToken();
    Logger().d('checkusername: $username');
    try {
      final response = await http.get(
          Uri.parse('$baseUrl/business/findByUsername/$username'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });

      Logger().d('Response: ${response.body}');
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          _errorMessage = data['messages']['message'];
        });
      } else {
        setState(() {
          _errorMessage = null;
        });
      }
    } catch (e) {
      Logger().e(e);
      setState(() {
        _errorMessage = 'Failed to check username';
      });
    }
  }

  Future<void> _checkEmail(String email) async {
    String token = await getToken();
    Logger().d('checkusername: $email');
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/business/findByEmail/$email'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      Logger().d('Response: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _errorMessageEmail = data['messages']['message'];
        });
      } else {
        setState(() {
          _errorMessageEmail = null;
        });
      }
    } catch (e) {
      Logger().e(e);
      setState(() {
        _errorMessageEmail = 'Failed to check email';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.backgroundColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        'Sari',
                        style: TextStyle(
                            fontSize: screenSize.height * 0.06,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    const Text('Register', style: AppTypography.heading1),
                    const Text('Create your business account.',
                        style: AppTypography.bodyText),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    TextField(
                      controller: username,
                      decoration: AppForm.whiteField.copyWith(
                          labelText: 'Username', errorText: _errorMessage),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    TextField(
                      controller: email,
                      decoration: AppForm.whiteField.copyWith(
                          labelText: 'Email', errorText: _errorMessageEmail),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    TextField(
                      controller: password,
                      obscureText: obscurePassword,
                      decoration: AppForm.whiteField.copyWith(
                        labelText: 'Password',
                        errorText: errorPassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    TextField(
                      controller: confirmPassword,
                      obscureText: obscureConfirmPassword,
                      decoration: AppForm.whiteField.copyWith(
                        labelText: 'Confirm Password',
                        errorText: errorConfirmPassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              obscureConfirmPassword = !obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                              if (username.text.isEmpty) {
                                _errorMessage = "Username is empty";
                              }

                              if (email.text.isEmpty) {
                                _errorMessageEmail = "Email is empty";
                              }

                              if (password.text.isEmpty) {
                                errorPassword = 'Password is empty';
                              }
                              if (isErrorConfirmPassword) {
                                errorConfirmPassword =
                                    'Confirm Password is empty';
                              }

                              if (isErrorUsername ||
                                  isErrorEmail ||
                                  isErrorPassword ||
                                  isErrorConfirmPassword) {
                                isLoading = false;
                              }

                              if (password.text != confirmPassword.text) {
                                isErrorConfirmPassword = true;
                                errorConfirmPassword =
                                    'Password does not match';
                                isLoading = false;
                              }
                            });

                            // If there are any errors, return early
                            if (isErrorUsername ||
                                isErrorEmail ||
                                isErrorPassword ||
                                isErrorConfirmPassword) {
                              return;
                            }

                            try {
                              if (username.text.length > 4 &&
                                  password.text.length >= 8 &&
                                  email.text.contains('@')) {
                                // Call the navigation asynchronously and await its completion
                                await GoRouter.of(context)
                                    .pushReplacement('/loading', extra: {
                                  'username': username.text.trimRight(),
                                  'email': email.text.trimRight(),
                                  'password': password.text,
                                  'fromPage': 'register'
                                });
                              }
                            } catch (e) {
                              // Handle any errors during navigation or registration process
                              print('Error during registration: $e');
                            } finally {
                              // Ensure loading state is turned off after the operation
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          style: AppForm.darkButton,
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(color: AppColors.dirtyWhite),
                          ),
                        )),
                    SizedBox(
                      height: screenSize.height * 0.075,
                    ),
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
                                  GoRouter.of(context).pop();
                                },
                            )
                          ])),
                    )
                  ],
                ),
              ),
            )));
  }
}
