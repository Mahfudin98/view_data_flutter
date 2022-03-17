import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/model/products_model.dart';
import 'package:new_app/service/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsController with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<ProductsModel> _products = [];
  List<ProductsModel> get dataProducts => _products;

  Future<List<ProductsModel>> getDataProducts() async {
    String? token;
    final SharedPreferences localStorage = await _prefs;
    token = localStorage.getString('data')?.replaceAll("\"", "");

    var headers = {'Authorization': 'Bearer $token'};

    final response = await http.get(Network().indexProducts, headers: headers);

    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _products = result
          .map<ProductsModel>((json) => ProductsModel.fromJson(json))
          .toList();
      return _products;
    } else {
      throw Exception();
    }
  }
}
