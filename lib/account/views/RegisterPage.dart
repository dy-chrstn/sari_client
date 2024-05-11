import 'package:flutter/material.dart';
import 'package:sari/utils/theme/colors.dart';
import 'package:sari/utils/theme/typography.dart';

class RegisterBusinessAcc extends StatefulWidget {
  const RegisterBusinessAcc({super.key});

  @override
  State<RegisterBusinessAcc> createState() => _RegisterBusinessAccState();
}

class _RegisterBusinessAccState extends State<RegisterBusinessAcc> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return const SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Column(
              children: [
                Center(
                  child: Text(
                    'Register App',
                    style: AppTypography.heading1,
                  ),
                ),
              ],
            )));
  }
}
