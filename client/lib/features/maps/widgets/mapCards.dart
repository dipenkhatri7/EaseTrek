import 'package:client/constant/constants.dart';
import 'package:flutter/material.dart';

class MapCards extends StatelessWidget {
  final String mapStyle;
  final String imageName;
  const MapCards({Key? key, required this.mapStyle, required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.45),
      ),
      elevation: 8,
      child: Column(
        children: [
          Image(
            image: AssetImage(
              "images/$imageName",
            ),
            fit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.208,
          ),
          Text(
            mapStyle,
            style: const TextStyle(
                fontSize: 14.45,
                fontWeight: FontWeight.bold,
                color: GlobalVariables.titleColor,
                fontFamily: 'Urbanist',
                letterSpacing: 1.85,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
