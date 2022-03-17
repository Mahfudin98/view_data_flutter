import 'package:flutter/material.dart';

class ProductsModel {
  final String name;
  final String price;
  final String origin;

  ProductsModel({
    required this.price,
    required this.name,
    required this.origin,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        name: json['name'],
        price:
            json['price'].toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), ''),
        origin: json['origin_order'],
      );
}
