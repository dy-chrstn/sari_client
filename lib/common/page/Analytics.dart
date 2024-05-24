import 'package:flutter/material.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/typography.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'Analytics',
          style: AppTypography.heading1,
        ),
      ),
    ));
  }
}