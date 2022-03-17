import 'package:flutter/material.dart';
import 'package:new_app/views/products/products.dart';
import 'package:new_app/views/teams/teams.dart';

import './card_menu.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      primary: false,
      children: [
        CardMenu(
          onClick: () {},
          image: 'assets/images/chart.png',
          textTitle: "Chart",
        ),
        CardMenu(
          onClick: () {},
          image: 'assets/images/report.png',
          textTitle: "Report",
        ),
        CardMenu(
          onClick: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsPage(),
              ),
            );
          },
          image: 'assets/images/product.png',
          textTitle: "Product",
        ),
        CardMenu(
          onClick: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamsPage(),
              ),
            );
          },
          image: 'assets/images/teams.png',
          textTitle: "Teams",
        ),
      ],
      crossAxisCount: 2,
    );
  }
}
