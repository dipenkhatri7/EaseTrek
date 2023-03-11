import 'package:client/constant/constants.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final bool isNotEmail;
  final TextInputType keyboardType;
  final bool isObscure;
  final TextEditingController controller;
  const AuthTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.isNotEmail,
    required this.keyboardType,
    required this.controller,
    required this.isObscure,
  }) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.45,
      margin: const EdgeInsets.symmetric(horizontal: 16.45),
      child: TextFormField(
        obscureText: widget.isObscure,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your ${widget.hintText}';
          }
          return null;
        },
        enabled: widget.isNotEmail,
        decoration: InputDecoration(
          prefixIcon: InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 1.45),
              child: Icon(
                widget.icon,
                color: GlobalVariables.backgroundColor,
                size: 20.45,
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(top: 10),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18.45),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18.45),
            ),
            borderSide: BorderSide(
              color: Colors.black38,
              width: 1,
            ),
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 16.45,
            fontFamily: 'Urbanist',
            letterSpacing: 0.45,
          ),
        ),
      ),
    );
  }
}
