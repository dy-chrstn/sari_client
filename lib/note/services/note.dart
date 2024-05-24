import 'dart:convert';
import '../../common/utils/env.dart';
import '../../common/token/services/token.dart';
import '../model/note.dart';
import 'package:http/http.dart' as http;

Future<NoteModel> getNote(String noteId, String userId) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/note/get/$userId/$noteId');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      final note = NoteModel.fromJson(data['response']);
      // Logger().d(data['response']);

      return note;
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

Future<List<NoteModel>> getNoteList(String userId) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/note/getAll/$userId');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      final noteList = <NoteModel>[];
      data['response']
          .forEach((e) => noteList.add(NoteModel.fromJson(e)));
      // Logger().d(data['response']);

      return noteList;
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

Future<NoteModel> createNote(NoteModel note, String userId) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/note/register/$userId');
    final response = await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: jsonEncode(note.toJson()));
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      final note = NoteModel.fromJson(data['response']);
      // Logger().d(data['response']);

      return note;
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

Future<void> updateNote(NoteModel note, String userId) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/note/update/$userId/${note.id}');
    final response = await http.put(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: jsonEncode(note.toJson()));
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      // final note = NoteModel.fromJson(data['response']);
      // Logger().d(data['response']);

      return data['messages']['message'];
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

Future<void> deleteNote(String noteId, String userId) async {
  String token = await getToken();
  // Logger().d('token: $token');

  try {
    final url = Uri.parse('$baseUrl/note/delete/$userId/$noteId');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final data = jsonDecode(response.body);
    // Logger().d(data);

    if (data['messages']['code'] == 0) {
      // Logger().d(data['response']);

      return data['messages']['message'];
    } else {
      // Logger().e(data['messages']['message']);
      return data['messages']['message'];
    }
  } catch (e) {
    // Logger().e(e);
    throw e.toString();
  }
}

