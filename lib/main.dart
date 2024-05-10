import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sari/token/services/token.dart';
import 'package:sari/user_acc/services/businessAcc.dart';

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
            onPressed: () => registerBusinessAcc('test_username', 'test1@gmail.com', 'test1234'),
            child: const Text('Register'),
          ),
        ),
      ),
    );
  }
}
