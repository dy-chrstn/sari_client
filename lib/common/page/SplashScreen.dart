import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sari/common/utils/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement('/business/login');
    });
  }

  @override
  void dispose(){
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sari',
            style: TextStyle(
                fontSize: screenSize.height * 0.10,
                fontWeight: FontWeight.w600,
                color: AppColors.dirtyWhite),
          ),
          SizedBox(height: screenSize.height * 0.08,)
        ],
      ),
    ));
  }
}
