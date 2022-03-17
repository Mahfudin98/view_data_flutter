import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_app/controller/auth/login_controller.dart';
import 'package:new_app/views/auth/components/background.dart';
import 'package:new_app/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var username, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(content: Text(msg));
    // ignore: deprecated_member_use
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: BackgroundLogin(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (usernameValue) {
                    if (usernameValue!.isEmpty) {
                      return 'Masukan Username Kamu';
                    }
                    username = usernameValue;
                    return null;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.text,
                  obscureText: _secureText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  validator: (passwordValue) {
                    if (passwordValue!.isEmpty) {
                      return 'Masukan Password Kamu';
                    }
                    password = passwordValue;
                    return null;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 136, 134),
                        Color.fromARGB(255, 255, 177, 41),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 2.5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(0),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    child: Text(
                      _isLoading ? 'Processing..' : 'LOGIN',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'username': username,
      'password': password,
    };

    var res = await LoginController().auth(data);
    var body = json.decode(res.body);
    if (body['status'] == 'success') {
      final SharedPreferences localStorage = await _prefs;
      localStorage.setString('data', json.encode(body['data']));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
