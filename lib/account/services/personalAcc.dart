import 'package:sari/token/services/token.dart';
import 'package:sari/account/model/personalAcc.dart';
import 'package:sari/utils/env.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Future<PersonalAccModel> loginPersonalAcc(String email, String password) async {
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
    throw e.toString();
  }
}

Future<PersonalAccModel> registerPersonalAcc(
    String owner, String name, int pin) async {
  String token = await getToken();
  Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/registerProfile/$owner');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(PersonalAccModel( owner: owner, name: name, pin: pin)));
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
    throw e.toString();
  }
}

Future<List<PersonalAccModel>> getPersonalAccList(String owner) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/profile/retrieve/$owner');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final data = jsonDecode(response.body);
    // Logger().d('Response: $data');

    if (data['messages']['code'] == 0) {
      final personalAccList = <PersonalAccModel>[];
      data['response']
          .forEach((e) => personalAccList.add(PersonalAccModel.fromJson(e)));
      // Logger().d(data['response']);

      return personalAccList;
    } else {
      Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    Logger().e(e);
    throw e.toString();
  }
}

Future<PersonalAccModel> updateProfile(
    String owner, String name, int pin) async {
  String token = await getToken();
  Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/updateProfileAcc/$owner');
    final response = await http.put(url,
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
    throw e.toString();
  }
}

Future<PersonalAccModel> deleteProfile(String owner) async {
  String token = await getToken();
  Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/deleteProfileAcc/$owner');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
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
    throw e.toString();
  }
}