import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:sari/account/view/profile/EnterPin.dart';
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
  GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/loading',
      builder: (context, state) {
        final extra = state.extra as Map<String, String>;
        final username = extra['username'] ?? '';
        final email = extra['email'] ?? '';
        final password = extra['password'] ?? '';
        final fromPage = extra['fromPage'] ?? '';

        return LoadingScreen(
            username: username,
            email: email,
            password: password,
            fromPage: fromPage);
      },
    ),
    GoRoute(
        path: '/business/login',
        builder: (context, state) => const LoginPage(message: null)),
    GoRoute(
        path: '/business/register',
        builder: (context, state) => const RegisterBusinessAcc()),
    GoRoute(
        path: '/profile/list',
        builder: (context, state) {
          final extra = state.extra as String;
          final userId = extra;
          return ProfilesPage(userId: userId);
        }),
    GoRoute(
      path: '/profile/create/name',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;

        final userId = extra['userId'] ?? '';
        final names = extra['names'] ?? [];
        return ProfileName(userId: userId, names: names);
      },
    ),
    GoRoute(
      path: '/profile/create/createPin',
      builder: (context, state) {
        final extra = state.extra as Map<String, String>;

        final userId = extra['userId'] ?? '';
        final name = extra['name'] ?? '';

        return CreatePin(userId: userId, name: name);
      },
    ),
    GoRoute(
      path: '/profile/create/confirmPin',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;

        final userId = extra['userId'] ?? '';
        final name = extra['name'] ?? '';
        final pin = extra['pin'] ?? '';

        return ConfirmPin(userId: userId, name: name, pin: pin);
      },
    ),
    GoRoute(
      path: '/profile/login/enterPin',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;

        final userId = extra['userId'] ?? '';
        final name = extra['name'] ?? '';
        final pin = extra['pin'] ?? '';

        return EnterPin(userId: userId, name: name, pin: pin);
      },
    ),
    GoRoute(
      path: '/product/list',
      builder: (context, state) {
        final extra = state.extra as Map<String, String>;
        final userId = extra['userId'] ?? '';
        final name = extra['name'] ?? '';
        return HomePage(userId: userId, name: name);
      },
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
