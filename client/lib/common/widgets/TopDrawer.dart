import 'package:client/common/widgets/textStyle.dart';
import 'package:client/constant/constants.dart';
import 'package:client/features/auth/screens/authPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopDrawer extends StatefulWidget {
  const TopDrawer({Key? key}) : super(key: key);

  @override
  State<TopDrawer> createState() => _TopDrawerState();
}

class _TopDrawerState extends State<TopDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<ShapeBorder?> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = ShapeBorderTween(
      begin: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.45),
          bottomRight: Radius.circular(24.45),
        ),
      ),
      end: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.45),
          bottomRight: Radius.circular(24.45),
        ),
      ),
    ).animate(_animationController);
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.45,
      shape: ShapeBorder.lerp(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.45),
            bottomRight: Radius.circular(24.45),
          ),
        ),
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.45),
            bottomRight: Radius.circular(24.45),
          ),
        ),
        0.45,
      ),
      width: MediaQuery.of(context).size.width * 0.5545,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => ClipRRect(
          child: child,
        ),
        child: ListView(children: <Widget>[
          _headerItem(context),
          const SizedBox(
            height: 10,
          ),
          _drawerItem(icon: Icons.home, text: "Home", onTap: () {}),
          const Divider(),
          _drawerItem(icon: Icons.person, text: "Profile", onTap: () {}),
          const Divider(),
          _drawerItem(icon: Icons.settings, text: "Settings", onTap: () {}),
          const Divider(),
          _drawerItem(
              icon: Icons.logout,
              text: "Logout",
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, AuthPage.routeName, (route) => false);
              }),
          const Divider(),
        ]),
      ),
    );
  }

  Widget _headerItem(BuildContext context) {
    return Material(
      elevation: 3.85,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.066,
        child: DrawerHeader(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12.45),
                child: Image(
                  image: AssetImage('images/logo.png'),
                  height: 48.45,
                  width: 48.45,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 5.45),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    color: Colors.black,
                    iconSize: 24.45),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String text,
    required Function onTap,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.45),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15.45,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.85),
            ),
          ),
        ],
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
