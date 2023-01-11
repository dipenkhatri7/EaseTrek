import 'package:client/constant/constants.dart';
import 'package:flutter/material.dart';
import '../../provider/userProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hello, ${Provider.of<UserProvider>(context).user.name}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 8.45,
          ),
          Text(
            '(${Provider.of<UserProvider>(context).user.email})',
            style: const TextStyle(
                color: GlobalVariables.titleColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.45,
                fontFamily: 'Urbanist',
                letterSpacing: 0.45),
          ),
        ],
      ),
    );
  }
}
