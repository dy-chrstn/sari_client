import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sari/user_acc/services/personalAcc.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => getPersonalAccList('663e1f3ad2c7ff942479d6d8'),
            child: const Text('Get Profiles'),
          ),
        ),
      ),
    );
  }
}
