import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool hideStatus;
  final String hintText;
  final IconData icon;
  final Function? onPress;
  const TextFields(
      {Key? key,
      required this.icon,
      required this.controller,
      required this.labelText,
      required this.hideStatus,
      required this.hintText,
      this.onPress})
      : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  bool ishidden = false;
  Widget build(BuildContext context) {
    return Container(
      width: widget.icon == Icons.search
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * 0.9,
      height: widget.icon == Icons.search
          ? MediaQuery.of(context).size.height * 0.064
          : MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.45),
      ),
      child: TextFormField(
        autocorrect: false,
        obscureText: widget.hideStatus,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            size: widget.icon == Icons.search ? 25.45 : 22.45,
            color: Colors.black,
          ),
          suffixIcon: widget.icon == Icons.email
              ? Icon(
                  Icons.check_circle,
                  color: Colors.grey,
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      ishidden = !ishidden;
                    });
                  },
                  child: ishidden == false
                      ? Icon(
                          Icons.visibility,
                        )
                      : Icon(Icons.visibility_off),
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
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
        onTap: () {
          widget.onPress!();
        },
      ),
    );
  }
}
