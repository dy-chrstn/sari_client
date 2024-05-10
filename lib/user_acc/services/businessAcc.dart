import 'package:sari/token/services/token.dart';
import 'package:sari/user_acc/model/businessAcc.dart';
import 'package:sari/utils/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Future<Object> loginBusinessAcc(String email, String password) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({'username': email, 'password': password}));
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      final businessAcc = BusinessAccModel.fromJson(data['response']);
      // Logger().d(data['response']);

      return businessAcc;
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    return e.toString();
  }
}

Future<Object> registerBusinessAcc(String username, String email, String password) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({'username': username, 'email': email, 'password': password}));
    final data = jsonDecode(response.body);
    // Logger().d('Response: $data');

    if (data['messages']['code'] == 0) {
      final businessAcc = BusinessAccModel.fromJson(data['response']);
      // Logger().d(data['response']);

      return businessAcc;
    } else {
      Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    Logger().e(e);
    return e.toString();
  }
}