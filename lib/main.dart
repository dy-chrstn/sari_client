import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:sari/utils/page/LoadingScreen.dart';
import 'package:sari/utils/page/SplashScreen.dart';
import 'package:sari/account/view/profile/ConfirmPinPage.dart';
import 'package:sari/account/view/profile/CreatePinPage.dart';
import 'package:sari/account/view/business/BusinessLoginPage.dart';
import 'package:sari/account/view/profile/ProfileNamePage.dart';
import 'package:sari/account/view/profile/ProfilesPage.dart';
import 'package:sari/account/view/business/BusinessRegisterPage.dart';
import 'package:sari/product/views/HomePage.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    Main(),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/loading', builder: (context, state) => const LoadingScreen( username: '', password: '')),
      GoRoute(path: '/business/login', builder: (context, state) => const LoginPage(message: null)),
      GoRoute(path: '/business/register', builder: (context, state) => const RegisterBusinessAcc()),
      GoRoute(path: '/profile/list', builder: (context, state) => const ProfilesPage()),
      GoRoute(path: '/profile/create/name', builder: (context, state) => const ProfileName(),),
      GoRoute(path: '/profile/create/createPin', builder: (context, state) => const CreatePin(),),
      GoRoute(path: '/profile/create/confirmPin', builder: (context, state) => const ConfirmPIn(),),
      GoRoute(path: '/product/list', builder: (context, state) => const HomePage(),),
    ]
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      
    );
  }
}
