import 'package:flutter/material.dart';

class MarketPlace extends StatefulWidget {
  static const String routeName = '/marketPlace';
  MarketPlace({Key? key}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Market Place"),
    );
  }
}
