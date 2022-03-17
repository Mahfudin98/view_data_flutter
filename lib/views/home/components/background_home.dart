import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  final Widget child;
  const BackgroundHome({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/top_header.png'),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
