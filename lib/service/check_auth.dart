import 'package:flutter/material.dart';
import 'package:new_app/views/auth/login.dart';
import 'package:new_app/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    final SharedPreferences localStorage = await _prefs;
    var token = localStorage.getString('data');

    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (isAuth) {
      child = HomePage();
    } else {
      child = LoginPage();
    }

    return Scaffold(
      body: child,
    );
  }
}
