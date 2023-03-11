import 'package:flutter/material.dart';
import '../../constant/constants.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color;
  final Color textColor;
  const Button(
      {Key? key,
      required this.text,
      required this.onPress,
      required this.color,
      required this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        // color: color,
        decoration: BoxDecoration(
          border: color == Colors.transparent
              ? Border.all(width: 1)
              : Border.all(width: 0),
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.0658,
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.45,
                fontWeight: FontWeight.bold,
                color: textColor,
                fontFamily: 'Urbanist',
                letterSpacing: 0.45,
                decoration: TextDecoration.none),
          ),
          onPressed: () {
            onPress();
          },
        ),
      ),
    );
  }
}
