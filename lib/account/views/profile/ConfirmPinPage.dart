import 'package:flutter/material.dart';

import '../../../utils/theme/colors.dart';

class ConfirmPIn extends StatefulWidget {
  const ConfirmPIn({super.key});

  @override
  State<ConfirmPIn> createState() => _ConfirmPInState();
}

class _ConfirmPInState extends State<ConfirmPIn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Text('Confirm Pin'),),
    );
  }
}