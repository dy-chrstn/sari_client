import 'package:sari/token/model/token.dart';
import 'package:sari/utils/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Future<void> getToken() async {
  final url = Uri.parse('$baseUrl/getToken');

  String basicAuth = 'Basic ${base64Encode(utf8.encode('$userAuth:$passwordAuth'))}';

  try {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': basicAuth
    });

    final data = jsonDecode(response.body);

    if(data['messages']['code'] == 0){
      // Parse the token using TokenModel
        final tokenModel = TokenModel.fromJson(data['response']['token']);
        // Access the token from the TokenModel object
        final token = tokenModel.token;
        Logger().d('Token: $token');
    }else{
      Logger().e(data['messages']['message']);
    }
  } catch (e) {
    Logger().e(e);
  }
}
