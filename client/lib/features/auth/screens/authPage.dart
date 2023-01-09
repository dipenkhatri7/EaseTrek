import 'package:client/constant/constants.dart';
import 'package:client/features/auth/screens/signIn.dart';
import 'package:client/features/auth/screens/signUp.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
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
            Hero(
              tag: 'logo',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('images/logo.png'),
                    height: 48.45,
                    width: 48.45,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  const Text(
                    'Ease Trek',
                    style: TextStyle(
                        fontSize: 34.45,
                        fontWeight: FontWeight.bold,
                        color: GlobalVariables.titleColor,
                        fontFamily: 'Urbanist',
                        letterSpacing: 1.85,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text('App Motto || Description Kind of'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Hero(
              tag: 'login',
              child: Card(
                elevation: 5.8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.45),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 20.45,
                          fontWeight: FontWeight.bold,
                          color: GlobalVariables.backgroundColor,
                          fontFamily: 'Urbanist',
                          letterSpacing: 1.85,
                          decoration: TextDecoration.none),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignIn()));
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Hero(
              tag: 'signUp',
              child: Card(
                elevation: 5.8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.45),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontSize: 20.45,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Urbanist',
                          color: GlobalVariables.backgroundColor,
                          letterSpacing: 1.85,
                          decoration: TextDecoration.none),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignUp()));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
