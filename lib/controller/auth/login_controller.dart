import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/service/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // ignore: prefer_typing_uninitialized_variables
  var token;

  _getToken() async {
    SharedPreferences localStorage = await _prefs;
    token = localStorage.getString('data');
  }

  auth(data) async {
    return await http.post(
      Network().login,
      body: jsonEncode(data),
      headers: setHeader(),
    );
  }

  getData(apiUrl) async {
    await _getToken();
    return await http.get(
      Network().login,
      headers: setHeader(),
    );
  }

  setHeader() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
