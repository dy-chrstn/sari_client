import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsernameSearchPage extends StatefulWidget {
  @override
  _UsernameSearchPageState createState() => _UsernameSearchPageState();
}

class _UsernameSearchPageState extends State<UsernameSearchPage> {
  TextEditingController _usernameController = TextEditingController();
  Timer? _debounce;
  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _usernameController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchUsernames(_usernameController.text);
    });
  }

  _searchUsernames(String query) async {
    if (query.isEmpty) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    final response = await http.get(Uri.parse('https://yourapi.com/api/search_usernames?query=$query'));

    if (response.statusCode == 200) {
      setState(() {
        _suggestions = List<String>.from(json.decode(response.body));
      });
    } else {
      // Handle error
      print('Failed to load suggestions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Username Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_suggestions[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}