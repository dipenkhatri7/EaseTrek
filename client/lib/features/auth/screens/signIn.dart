import 'package:client/common/widgets/button.dart';
import 'package:client/common/widgets/textFields.dart';
import 'package:client/constant/constants.dart';
import 'package:client/features/auth/screens/forgotPassword.dart';
import 'package:client/features/auth/screens/signUp.dart';
import 'package:client/features/auth/services/authService.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  static const String routeName = '/signIn';
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();
  bool reload = false;
  void pageReload() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(image: AssetImage(''), fit: BoxFit.contain),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'logo',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('images/onlylogo.png'),
                    height: 78.45,
                    width: 78.45,
                  ),
                  Image(
                    image: AssetImage('images/name.png'),
                    height: 88.45,
                    width: 128.45,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Log In',
                style: TextStyle(
                    fontSize: 25.45,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    letterSpacing: 0.25,
                    decoration: TextDecoration.none),
              ),
            ),
            Hero(
              tag: 'signIn',
              child: Form(
                key: _signInFormKey,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Email address',
                              style: TextStyle(
                                  fontSize: 15.45,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black,
                                  fontFamily: 'Urbanist',
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextFields(
                            icon: Icons.email,
                            controller: _emailController,
                            hintText: '',
                            labelText: "Enter your Email",
                            hideStatus: false,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 15.45,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black,
                                  fontFamily: 'Urbanist',
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextFields(
                            icon: Icons.lock,
                            controller: _passwordController,
                            hintText: '',
                            labelText: "Enter your Password",
                            hideStatus: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: (() {
                Navigator.pushNamed(context, ForgetPassword.routeName);
              }),
              child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 10),
                child: (const Text(
                  'Forget Password?',
                  style: TextStyle(
                      fontSize: 14.85,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w500),
                )),
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            Hero(
              tag: 'login',
              child: Button(
                text: "Log In",
                onPress: () async {
                  if (_signInFormKey.currentState!.validate()) {
                    await authService.signInUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                  }
                },
                color: Colors.black,
                textColor: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(
                color: Colors.grey,
              ),
            ),
            const Text(
              'Or Login with',
              style: TextStyle(
                  fontSize: 15.45,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 76, 75, 75),
                  fontFamily: 'Urbanist',
                  decoration: TextDecoration.none),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.45),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: 28,
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.45),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: IconButton(
                      onPressed: () {
                        // Handle Facebook login
                      },
                      icon: Icon(
                        Icons.ac_unit,
                        size: 28,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.45),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: IconButton(
                      onPressed: () {
                        // Handle Apple login
                      },
                      icon: Icon(
                        size: 28,
                        Icons.apple,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont have an account?',
                  style: TextStyle(
                      fontSize: 15.45,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                      decoration: TextDecoration.none),
                ),
                TextButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, SignUp.routeName);
                  }),
                  child: (const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 14.85,
                        color: Colors.black,
                        fontFamily: 'Urbanist',
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w900),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
