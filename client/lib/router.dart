import 'package:client/features/auth/screens/authPage.dart';
import 'package:client/features/auth/screens/signIn.dart';
import 'package:client/features/auth/screens/signUp.dart';
import 'package:client/features/home/homeNav.dart';
import 'package:client/features/home/homePage.dart';
import 'package:client/features/maps/screens/maps.dart';
import 'package:client/features/marketPlace/screens/marketPlace.dart';
import 'package:client/features/search/screens/search.dart';
import 'package:client/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AuthPage());
    case SignIn.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SignIn());
    case SignUp.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SignUp());
    case HomeNav.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => HomeNav());
    case HomePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => HomePage());
    case Search.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => Search());
    case Maps.routeName:
      return MaterialPageRoute(settings: routeSettings, builder: (_) => Maps());
    case MarketPlace.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => MarketPlace());
    case Settings.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => Settings());
  }
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (_) => const Scaffold(
      body: Center(
        child: Text('Screen Does Not Exist'),
      ),
    ),
  );
}
