import 'package:flutter/material.dart';
import 'package:new_app/service/network.dart';

class HeaderHome extends StatelessWidget {
  final data;
  HeaderHome({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 32,
            backgroundImage: NetworkImage(
              Network().imageURL + data.profile.image.toString(),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.profile.name,
                style: const TextStyle(
                  fontFamily: 'Montserrat Medium',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                data.profile.position,
                style: const TextStyle(
                  fontFamily: 'Montserrat Regular',
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
