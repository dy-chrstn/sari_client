import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sari/account/services/personalAcc.dart';
import 'package:sari/account/views/LoginPage.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
   const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
    ),
  );
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
            onPressed: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()))
            },
            child: const Text('Open Login Page'),
          ),
        ),
      ),
    );
  }
}
