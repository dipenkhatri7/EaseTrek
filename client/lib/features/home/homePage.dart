import 'package:flutter/material.dart';

import '../../common/widgets/TopDrawer.dart';
import '../../constant/constants.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TopDrawer(),
      appBar: AppBar(
        backgroundColor: GlobalVariables.backgroundColor,
        title: const Text(
          'Ease Trek',
          style: TextStyle(
              fontSize: 22.45,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Urbanist',
              letterSpacing: 1.85,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
