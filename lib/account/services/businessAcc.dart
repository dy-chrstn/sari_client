import 'package:sari/common/token/services/token.dart';
import 'package:sari/account/model/businessAcc.dart';
import 'package:sari/common/utils/env.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Future<dynamic> loginBusinessAcc(String email, String password) async {
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
    Logger().d(data);

    if (data['messages']['code'] == 0) {
      // Logger().d(data['response']);

      return data;
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

Future<Object> registerBusinessAcc(
    String username, String email, String password) async {
  String token = await getToken();
  Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(
            {'username': username, 'email': email, 'password': password}));
    final data = jsonDecode(response.body);
    // Logger().d('Response: $data');

    if (data['messages']['code'] == 0) {
      final businessAcc = BusinessAccModel.fromJson(data['response']);
      final dynamic message = data['messages'];
      // Logger().d(data['response']);

      return message;
    } else {
      Logger().e(data['messages']['message']);
      return data['messages'];
    }
  } catch (e) {
    Logger().e(e);
    return e.toString();
  }
}

Future<Object> updateBusinessAcc(
    String username, String email, String password) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/update');
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(
            {'username': username, 'email': email, 'password': password}));
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

Future<Object> deleteBusinessAcc() async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/delete');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
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

Future<Object> checkUsername(String username) async {
  String token = await getToken();

  try {
    final url = Uri.parse('$baseUrl/checkUsername/$username');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final data = jsonDecode(response.body);

    Logger().d("Response: $data");
    if (data['messages']['code'] == 0) {
      final businessAcc = BusinessAccModel.fromJson(data['response']);

      Logger().d('businessAcc: $businessAcc');

      return businessAcc;
    } else {
      Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    Logger().d("Error: $e");
    return e.toString();
  }
}
