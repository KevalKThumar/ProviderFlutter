// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _isLoding = false;

  bool get isLoding => _isLoding;

  void changeLoding(val) {
    _isLoding = val;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    try {
      changeLoding(true);
      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.body.toString()),
        ));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw e.toString();
    }finally {
      changeLoding(false);
    }
  }
}
