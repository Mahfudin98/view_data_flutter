import 'package:flutter/material.dart';
import 'package:new_app/controller/auth/user_auth_controller.dart';
import 'package:new_app/views/home/components/background_home.dart';
import 'package:new_app/views/home/components/header_home.dart';
import 'package:new_app/views/home/components/home_menu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<UserAuthController>(context, listen: false).getData(),
        child: FutureBuilder(
          future:
              Provider.of<UserAuthController>(context, listen: false).getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<UserAuthController>(
              builder: (context, data, _) {
                return BackgroundHome(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          HeaderHome(data: data),
                          const SizedBox(height: 90),
                          const Expanded(child: HomeMenu()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
