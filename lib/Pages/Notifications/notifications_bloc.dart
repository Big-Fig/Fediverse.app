
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationsBloc with ChangeNotifier {
  String _dataUrl = "https://reqres.in/api/users?per_page=20";

  NotificationsBloc();

  int _mentions = 0;
  int _reposts = 0;
  int _favorites = 0;
  int _follows = 0;
  int _totals = 0;

  int get getMentions => _mentions;
  int get getReposts => _mentions;
  int get getFavorites => _mentions;
  int get getFollows => _mentions;
  int get getTotals => _totals;

  

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
      _jsonResonse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  String get getResponseText => _jsonResonse;

  List<dynamic> getResponseJson() {
    if (_jsonResonse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(_jsonResonse);
      // print(json['data']['avatar']);
      return json['data'];
    }
    return null;
  }
}