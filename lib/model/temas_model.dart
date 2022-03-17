import 'package:flutter/material.dart';

class TeamsModel {
  final String image;
  final String name;
  final String position;

  TeamsModel({
    required this.image,
    required this.name,
    required this.position,
  });

  factory TeamsModel.fromJson(Map<String, dynamic> json) => TeamsModel(
        name: json['name'],
        image: json['image'],
        position: json['position']['name'],
      );
}
