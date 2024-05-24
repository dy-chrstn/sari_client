import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sari/account/services/businessAcc.dart';
import 'package:sari/common/utils/theme/colors.dart';

class LoadingScreen extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  final String fromPage;

  const LoadingScreen(
      {super.key,
      required this.username,
      required this.email,
      required this.password,
      required this.fromPage});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late dynamic response;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () async {
      Logger().i('Loading Screen: \n Username: ${widget.username} \n Password: ${widget.password} \n FromPage: ${widget.fromPage}');
      if (widget.fromPage == 'login') {
        response = await loginBusinessAcc(widget.username, widget.password);
        
        Logger().d('Response: $response');

        if (response['messages']['code'] == 0) {
          GoRouter.of(context).go('/profile/list', extra: response['response']['userId']);
        } else {
          QuickAlert.show(
            context: context,
            title: 'Login Error',
            text: 'Username or password is incorrect',
            type: QuickAlertType.error,
            confirmBtnText: 'Confirm',
            confirmBtnColor: AppColors.primaryColor,
            onConfirmBtnTap: () {
              GoRouter.of(context)
                  .go('/business/login', extra: response['message']);
            },
          );
        }
      }else if( widget.fromPage == 'register'){
        response = await registerBusinessAcc(widget.username, widget.email, widget.password);

        String message = response['message'];
        // Logger().d('Register Response: $message');

        if (response['code'] == 0) {
          GoRouter.of(context).go('/profile/list');
        } else {
          QuickAlert.show(
            context: context,
            title: 'Register Error',
            text: message,
            type: QuickAlertType.error,
            confirmBtnText: 'Confirm',
            confirmBtnColor: AppColors.primaryColor,
            onConfirmBtnTap: () {
              GoRouter.of(context)
                  .go('/business/register', extra: response['message']);
            },
          );
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: LoadingAnimationWidget.prograssiveDots(
          color: AppColors.primaryColor,
          size: 54,
        ),
      ),
    );
  }
}
