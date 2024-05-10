import 'package:sari/token/model/token.dart';
import 'package:sari/utils/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Future<String> getToken() async {
  final url = Uri.parse('$baseUrl/getToken');

  String basicAuth = 'Basic ${base64Encode(utf8.encode('$userAuth:$passwordAuth'))}';

  try {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': basicAuth
    });

    final data = jsonDecode(response.body);

    if(data['messages']['code'] == 0){
        final tokenModel = TokenModel.fromJson(data['response']['token']);

        final token = tokenModel.token;
        // Logger().d('Token: $token');

        return token;
    }else{
      Logger().e(data['messages']['message']);

      return data['messages']['message'];
    }
  } catch (e) {
    Logger().e(e);
    return e.toString();
  }
}
