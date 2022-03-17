import 'package:flutter/material.dart';
import 'package:new_app/controller/auth/user_auth_controller.dart';
import 'package:new_app/controller/products/products_controller.dart';
import 'package:new_app/controller/teams/teams_controller.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatelessWidget {
  final Widget child;
  const ProviderWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserAuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => TeamsController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsController(),
        )
      ],
      child: child,
    );
  }
}
