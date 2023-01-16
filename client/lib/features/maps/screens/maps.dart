import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  static const String routeName = '/maps';
  Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Maps"),
    );
  }
}
