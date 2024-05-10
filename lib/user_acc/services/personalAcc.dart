import 'dart:ffi';

import 'package:sari/token/services/token.dart';
import 'package:sari/user_acc/model/personalAcc.dart';
import 'package:sari/utils/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Future <Object> loginPersonalAcc(String email, String password) async {
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
      final personalAcc = PersonalAccModel.fromJson(data['response']);
      // Logger().d(data['response']);

      return personalAcc;
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    return e.toString();
  }
}

Future <Object> registerPersonalAcc(String owner, String name, int pin) async {
  String token = await getToken();
  Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/registerProfile/$owner');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({'name': name, 'pin': pin}));
    final data = jsonDecode(response.body);
    Logger().d('Response: $data');

    if (data['messages']['code'] == 0) {
      final personalAcc = PersonalAccModel.fromJson(data['response']);
      Logger().d(data['response']);

      return personalAcc;
    } else {
      Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    Logger().e(e);
    return e.toString();
  }
}
