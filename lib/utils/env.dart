import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['DOMAIN']!;
String secretKey = dotenv.env['SECRET_KEY']!;
String userAuth = dotenv.env['USERNAME_AUTH']!;
String passwordAuth = dotenv.env['PASSWORD_AUTH']!;