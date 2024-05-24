import 'package:flutter/material.dart';

import '../../common/utils/theme/colors.dart';
import '../../common/utils/theme/typography.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'Scan QR Code',
          style: AppTypography.heading1,
        ),
      ),
    ));
  }
}
