import 'package:flutter/material.dart';
import 'package:sari/utils/theme/colors.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('HomePage'),
          SizedBox(height: screenSize.height * 0.02,),
          Text('Welcome, ${widget.name}'),
        ],

      ),
    ));
  }
}
