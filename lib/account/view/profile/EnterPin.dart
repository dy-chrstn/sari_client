import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:quickalert/quickalert.dart';

import '../../../utils/theme/colors.dart';
import '../../../utils/theme/typography.dart';
import '../../../widgets/form/AppForm.dart';

class EnterPin extends StatefulWidget {
  final String userId;
  final String name;
  final String pin;
  const EnterPin(
      {super.key, required this.userId, required this.name, required this.pin});

  @override
  State<EnterPin> createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  TextEditingController pin = TextEditingController();

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
          children: [
            SizedBox(
              height: screenSize.height * 0.03,
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
              height: screenSize.height * 0.01,
            ),
            Center(
              child: Text(
                'Welcome, ${widget.name}',
                style: TextStyle(
                    fontSize: screenSize.height * 0.03,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            SizedBox(
              height: screenSize.height * 0.12,
              width: screenSize.height * 0.12,
              child: Card(
                color: AppColors.primaryColor,
                shape: CircleBorder(),
                child: Icon(
                  Icons.person,
                  color: AppColors.dirtyWhite,
                  size: screenSize.height * 0.06,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Text('Enter Pin', style: AppTypography.heading1),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Pinput(
              controller: pin,
              closeKeyboardWhenCompleted: true,
              autofocus: true,
              keyboardType: TextInputType.number,
              obscureText: true,
              onCompleted: (value) {
                if (value == widget.pin.toString()) {
                  GoRouter.of(context).go('/product/list',
                      extra: {'userId': widget.userId, 'name': widget.name});
                } else {
                  QuickAlert.show(
                    context: context,
                    title: 'Login Error',
                    text: 'Pin is incorrect',
                    type: QuickAlertType.error,
                    confirmBtnText: 'Confirm',
                    confirmBtnColor: AppColors.primaryColor,
                    onConfirmBtnTap: () {
                      GoRouter.of(context).pop();
                    },
                  );
                }
              },
              defaultPinTheme: PinTheme(
                width: 64,
                height: 64,
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: AppColors.dirtyWhite,
                  fontWeight: FontWeight.w600,
                ),
                margin: EdgeInsetsDirectional.all(screenSize.width * 0.01),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.10,
            ),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  style: AppForm.whiteButton,
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: AppColors.textColor),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
