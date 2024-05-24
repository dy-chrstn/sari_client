import 'package:flutter/material.dart';
import 'package:sari/common/utils/theme/colors.dart';
import 'package:sari/common/utils/theme/typography.dart';

class HomePage extends StatefulWidget {
  final String userId;
  final String name;
  const HomePage({super.key, required this.userId, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: screenSize.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome, ${widget.name}', style: AppTypography.heading1),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  const Text('Home Page :))))', style: AppTypography.bodyText),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
