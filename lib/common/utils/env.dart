import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['DOMAIN']!;
String secretKey = dotenv.env['SECRET_KEY']!;
String userAuth = dotenv.env['USERNAME_AUTH']!;
String passwordAuth = dotenv.env['PASSWORD_AUTH']!;
String apiKey = dotenv.env['apiKey']!;
String authDomain = dotenv.env['authDomain']!;
String projectId = dotenv.env['projectId']!;
String storageBucket = dotenv.env['storageBucket']!;
String messagingSenderId = dotenv.env['messagingSenderId']!;
String appId = dotenv.env['appId']!;
String measurementId = dotenv.env['measurementId']!;



