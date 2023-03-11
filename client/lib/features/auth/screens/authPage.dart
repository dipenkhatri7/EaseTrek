import 'package:client/common/widgets/button.dart';
import 'package:client/constant/constants.dart';
import 'package:client/features/auth/screens/signIn.dart';
import 'package:client/features/auth/screens/signUp.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  static const String routeName = '/auth';
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 233, 233),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(image: AssetImage(''), fit: BoxFit.contain),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: 'logo',
              child: Image(
                image: AssetImage('images/Logo-ease-trek.png'),
                height: 290.45,
                width: 290.45,
              ),
            ),
            // Text('App Motto || Description Kind of'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Column(
              children: [
                Hero(
                  tag: 'login',
                  child: Button(
                    text: "Sign In",
                    onPress: () {
                      Navigator.pushNamed(context, SignIn.routeName);
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Hero(
                  tag: 'signUp',
                  child: Button(
                    text: "Create account",
                    onPress: () {
                      Navigator.pushNamed(context, SignUp.routeName);
                    },
                    color: Colors.transparent,
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
