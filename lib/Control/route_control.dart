import 'package:bookit/Constant/Strings/stringConst.dart';
import 'package:bookit/View/Screens/account.dart';
import 'package:bookit/View/Screens/home_screen.dart';
import 'package:bookit/View/Screens/login.dart';
import 'package:bookit/View/Screens/register.dart';
import 'package:bookit/View/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteController {
  static Route? onGenerateRoute(RouteSettings settings) {
    Map map = {
      StringConsts.splashScreen.value:
          MaterialPageRoute(builder: (context) => const SplashScreen()),
      StringConsts.registeration.value:
          MaterialPageRoute(builder: (context) => const Registeration()),
      StringConsts.homeScreen.value:
          MaterialPageRoute(builder: (context) =>  HomeScreen()),
      StringConsts.login.value: MaterialPageRoute(
        builder: (context) => const LogIn(),
      ),
      StringConsts.profile.value:
          MaterialPageRoute(builder: (context) => const AccountUser())
    };
    return map[settings.name];
  }
}
