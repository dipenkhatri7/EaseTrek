import 'package:client/common/widgets/textFields.dart';
import 'package:client/constant/constants.dart';
import 'package:client/constant/utils.dart';
import 'package:client/features/auth/services/authService.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signUp';
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF2F2F2),
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
                  const Image(
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
            Form(
              key: _signInFormKey,
              child: Card(
                elevation: 5.8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.45),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.342,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          'Create Account',
                          style: TextStyle(
                              fontSize: 20.45,
                              fontWeight: FontWeight.bold,
                              color: GlobalVariables.backgroundColor,
                              fontFamily: 'Urbanist',
                              letterSpacing: 1.85,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFields(
                          controller: _nameController,
                          hintText: 'Enter your name',
                          labelText: "Name",
                          hideStatus: false,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        TextFields(
                          controller: _emailController,
                          hintText: 'Enter your email',
                          labelText: "Email",
                          hideStatus: false,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFields(
                          controller: _passwordController,
                          hintText: 'Enter your password',
                          labelText: "Password",
                          hideStatus: true,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFields(
                          controller: _passwordConfirmController,
                          hintText: 'Confirm your password',
                          labelText: "Confirm Password",
                          hideStatus: true,
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Hero(
              tag: 'signUp',
              child: Card(
                color: GlobalVariables.backgroundColor,
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
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          letterSpacing: 1.85,
                          decoration: TextDecoration.none),
                    ),
                    onPressed: () async {
                      if (_signInFormKey.currentState!.validate()) {
                        await authService.signUpUser(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            confirmPassword: _passwordConfirmController.text,
                            context: context);
                        showSnackBar(context, 'Account created successfully');
                      }
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
