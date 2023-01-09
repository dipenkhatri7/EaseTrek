import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool hideStatus;
  final String hintText;
  const TextFields(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.hideStatus,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.045,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.45),
      ),
      child: TextFormField(
        autocorrect: false,
        obscureText: hideStatus,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.45),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.45),
          ),
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(
            fontSize: 11.45,
            fontWeight: FontWeight.bold,
            fontFamily: 'Urbanist',
            letterSpacing: 1.85,
            decoration: TextDecoration.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
