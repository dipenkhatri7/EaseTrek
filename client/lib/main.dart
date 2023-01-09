import 'package:client/constant/constants.dart';
import 'package:client/features/auth/screens/authPage.dart';
import 'package:client/features/auth/screens/signIn.dart';
import 'package:client/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ease Trek",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalVariables.selectedItemColor))),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: const AuthPage(),
    );
  }
}
