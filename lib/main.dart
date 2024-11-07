// ignore_for_file: camel_case_extensions

import 'package:bookit/Control/route_control.dart';
import 'package:bookit/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Constant/Strings/stringConst.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(home: MyApp()));
}

extension gap on num {
  vertical() => SizedBox(height: toDouble());

  horizontal() => SizedBox(width: toDouble());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveBreakpoints(breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ], child: child!),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteController.onGenerateRoute,
      initialRoute: StringConsts.homeScreen.value,
    );
  }
}
