import 'package:client/constant/constants.dart';
import 'package:client/features/home/homePage.dart';
import 'package:client/features/maps/screens/maps.dart';
import 'package:client/features/marketPlace/screens/marketPlace.dart';
import 'package:client/features/search/screens/search.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/TopDrawer.dart';
import '../../provider/userProvider.dart';
import 'package:provider/provider.dart';

class HomeNav extends StatefulWidget {
  static const String routeName = '/home';
  const HomeNav({Key? key}) : super(key: key);

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOption = [
    HomePage(),
    Search(),
    Maps(),
    MarketPlace(),
  ];
  void setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      // floatingActionButton: Container(
      //   height: 64.45,
      //   width: 64.45,
      //   child: FloatingActionButton(
      //     elevation: 10.45,
      //     splashColor: GlobalVariables.backgroundColor,
      //     backgroundColor: GlobalVariables.backgroundColor,
      //     onPressed: () => {},
      //     child: const Icon(
      //       Icons.camera,
      //       size: 38.45,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: GlobalVariables.backgroundColor,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 28.45,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 28.45,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 28.45,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_card,
              size: 28.45,
            ),
            label: 'Market Place',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: setIndex,
        // shape: CircularNotchedRectangle(),
        // notchMargin: 8.45,
        // color: GlobalVariables.backgroundColor,
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.home,
        //         color: Colors.white,
        //         size: 28.845,
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.search,
        //         color: Colors.white,
        //         size: 28.845,
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.map,
        //         color: Colors.white,
        //         size: 28.845,
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.add_card,
        //         color: Colors.white,
        //         size: 28.845,
        //       ),
        //     ),
        //   ],
        // ),
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: Text(
      //         'Hello, ${Provider.of<UserProvider>(context).user.name}',
      //         style: const TextStyle(
      //           color: Colors.black,
      //           fontSize: 22,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 8.45,
      //     ),
      //     Text(
      //       '(${Provider.of<UserProvider>(context).user.email})',
      //       style: const TextStyle(
      //           color: GlobalVariables.titleColor,
      //           fontWeight: FontWeight.w400,
      //           fontSize: 12.45,
      //           fontFamily: 'Urbanist',
      //           letterSpacing: 0.45),
      //     ),
      //   ],
      // ),
    );
  }
}
