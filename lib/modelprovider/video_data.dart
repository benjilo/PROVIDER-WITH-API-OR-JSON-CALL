import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class videodata with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Future<void> get fetchData async {
    final response = await get(
      Uri.parse('https://benjilo.github.io/titleapi/youtube.json'),
    );

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
      }
    } else {
      _error = true;
      _errorMessage = 'Error: maybe your internet';
      _map = {};
    }
    notifyListeners();
  }

  // void emptythePage() {
  //   _error = false;
  //   _errorMessage = '';
  //   _map = {};
  //   notifyListeners();
  // }

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;
}
