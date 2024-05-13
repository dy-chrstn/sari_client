import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sari/account/services/businessAcc.dart';
import 'package:sari/utils/theme/colors.dart';

class LoadingScreen extends StatefulWidget {
  final String username;
  final String password;

  const LoadingScreen(
      {Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late dynamic response;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      response = await loginBusinessAcc(widget.username, widget.password);

      Logger().d('Response: $response');
      var message = response['message'];
      Logger().d('Response: $message');

      if (response['code'] == 0) {
        GoRouter.of(context).go('/product/list');
      } else {
        QuickAlert.show(
          context: context,
          title: 'Error',
          text: message,
          type: QuickAlertType.error,
          confirmBtnText: 'Confirm',
          onConfirmBtnTap: () {
            GoRouter.of(context)
                .go('/business/login', extra: response['message']);
          },
        );
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
