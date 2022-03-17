import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  final Widget child;
  const BackgroundLogin({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/top1.png',
              width: size.width,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/top2.png',
              width: size.width,
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: Image.network(
              'https://app-r.lsskincare.id/images/logo.png',
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom1.png',
              width: size.width,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/bottom2.png',
              width: size.width,
            ),
          ),
          child
        ],
      ),
    );
  }
}
