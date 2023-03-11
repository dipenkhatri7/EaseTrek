import 'package:client/common/widgets/textFields.dart';
import 'package:client/constant/constants.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  static const String routeName = '/search';
  Search({Key? key}) : super(key: key);
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backScreen,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 8.45),
          padding: EdgeInsets.only(left: 22.45, right: 22.45),
          child: TextFields(
            icon: Icons.search,
            hintText: "",
            controller: _search,
            labelText: "Search",
            hideStatus: false,
          ),
        ),
      ),
    );
  }
}
