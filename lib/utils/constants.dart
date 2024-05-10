import 'package:flutter_dotenv/flutter_dotenv.dart';

// class Constants {
//   static String get apiDomain => dotenv.get('DOMAIN');
//   static String get userAuth => dotenv.get('USERNAME_AUTH');
//   static String get passwordAuth => dotenv.get('PASSWORD_AUTH');
//   static String get secretKey => dotenv.get('SECRET_KEY');
// }

String baseUrl = dotenv.env['DOMAIN']!;
String secretKey = dotenv.env['SECRET_KEY']!;
String userAuth = dotenv.env['USERNAME_AUTH']!;
String passwordAuth = dotenv.env['PASSWORD_AUTH']!;