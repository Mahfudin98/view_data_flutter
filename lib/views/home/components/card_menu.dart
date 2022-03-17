import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final VoidCallback onClick;
  final String image;
  final String textTitle;
  const CardMenu({
    Key? key,
    required this.onClick,
    required this.image,
    required this.textTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardTextStyle = const TextStyle(
      fontFamily: 'Montserrat Regular',
      fontSize: 14,
      color: Color.fromRGBO(63, 53, 63, 1),
    );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      child: TextButton(
        onPressed: onClick,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 128,
            ),
            Text(textTitle, style: cardTextStyle),
          ],
        ),
      ),
    );
  }
}
