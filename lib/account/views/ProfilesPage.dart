import 'package:flutter/material.dart';
import 'package:sari/utils/theme/colors.dart';

import '../../utils/theme/typography.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({super.key});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(child: Text('Profiles', style: AppTypography.heading1),)
          ],
        )
      )
    ));
  }
}
