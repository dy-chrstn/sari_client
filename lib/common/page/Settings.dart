import 'package:flutter/material.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/typography.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'Settings',
          style: AppTypography.heading1,
        ),
      ),
    ));
  }
}
