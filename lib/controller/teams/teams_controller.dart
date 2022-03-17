import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/model/temas_model.dart';
import 'package:new_app/service/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeamsController with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<TeamsModel> _teams = [];
  List<TeamsModel> get dataTeams => _teams;

  Future<List<TeamsModel>> getDataTeams() async {
    String? token;
    final SharedPreferences localStorage = await _prefs;
    token = localStorage.getString('data')?.replaceAll("\"", "");

    var headers = {'Authorization': 'Bearer $token'};

    final response = await http.get(Network().indexTeams, headers: headers);

    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _teams =
          result.map<TeamsModel>((json) => TeamsModel.fromJson(json)).toList();
      return _teams;
    } else {
      throw Exception();
    }
  }
}
