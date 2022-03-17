import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/model/user_auth_model.dart';
import 'package:new_app/service/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthController with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late UserAuthModel profile;

  Future<void> getData() async {
    String? token;
    final SharedPreferences localStorage = await _prefs;
    token = localStorage.getString('data')?.replaceAll("\"", "");

    var headers = {'Authorization': 'Bearer $token'};

    final response = await http.get(Network().userAuth, headers: headers);
    final result = json.decode(response.body) as Map<String, dynamic>;

    profile = UserAuthModel(
      image: result['data']['image'],
      name: result['data']['name'],
      position: result['data']['position'],
    );
  }
}
