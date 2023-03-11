import 'package:client/common/widgets/textFields.dart';
import 'package:client/constant/constants.dart';
import 'package:client/features/auth/screens/signIn.dart';
import 'package:client/features/auth/screens/signUp.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  static const String routeName = '/forgetPassword';
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isLoading = false;
  final _forgetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("images/LandingSignIn.png"),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Hero(
                tag: "Logo",
                child: Image(
                  image: AssetImage('images/logo.png'),
                  height: 44.45,
                  width: 44.45,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Ease Trek',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: GlobalVariables.titleColor,
                  fontFamily: 'Urbanist',
                  letterSpacing: 1.45,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32.45,
          ),
          Hero(
            tag: 'signIn',
            child: Form(
              key: _forgetPasswordFormKey,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.45),
                ),
                elevation: 8.45,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: 325,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 14.45,
                          ),
                          const Text(
                            'Enter your email address',
                            style: TextStyle(
                                color: GlobalVariables.backgroundColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                letterSpacing: 0.88),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFields(
                            controller: _emailController,
                            hintText: "Enter your Email",
                            labelText: "Email",
                            hideStatus: false,
                            icon: Icons.email,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 110.45,
                      child: Card(
                        color: GlobalVariables.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.45),
                        ),
                        elevation: 14,
                        child: Container(
                          width: 187,
                          height: 40.45,
                          child: TextButton(
                            child: isLoading == false
                                ? const Text(
                                    "Send OTP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Urbanist",
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16.85,
                                        letterSpacing: 1.2),
                                  )
                                : const CircularProgressIndicator(),
                            onPressed: () async {
                              if (_forgetPasswordFormKey.currentState!
                                  .validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 28.45,
          ),
          Center(
            child: Container(
              width: 300,
              child: const Divider(
                color: GlobalVariables.backgroundColor,
                thickness: 1.345,
              ),
            ),
          ),
          const SizedBox(
            height: 14.45,
          ),
          const Text(
            "Don't have an account?",
            style: TextStyle(
                fontSize: 14.85,
                color: GlobalVariables.backgroundColor,
                fontFamily: 'Urbanist',
                letterSpacing: 0.8),
          ),
          const SizedBox(
            height: 8,
          ),
          Hero(
            tag: "login",
            child: Card(
              color: GlobalVariables.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.45),
              ),
              elevation: 10,
              child: Container(
                width: 187,
                height: 40.45,
                child: TextButton(
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w700,
                        fontSize: 16.85,
                        letterSpacing: 1.2),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUp.routeName);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 14.45,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.45),
            ),
            elevation: 14,
            child: Container(
              width: 187,
              height: 40.45,
              child: TextButton(
                child: const Text(
                  "Go Back",
                  style: TextStyle(
                      color: GlobalVariables.backgroundColor,
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w900,
                      fontSize: 16.85,
                      letterSpacing: 1.2),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 18.45,
          ),
        ]),
      ),
    );
  }
}
