import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:sari/account/views/LoginPage.dart';
import 'package:sari/account/views/ProfilesPage.dart';
import 'package:sari/account/views/RegisterPage.dart';

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
      GoRoute(path: '/', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/register', builder: (context, state) => const RegisterBusinessAcc()),
      GoRoute(path: '/profiles', builder: (context, state) => const ProfilesPage()),
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
