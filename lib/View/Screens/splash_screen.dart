import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: GFLoader(
            loaderIconOne: const Icon(size: 30, Icons.downloading,),
            duration: const Duration(seconds: 5), // reduced duration
            size: 35,
            loaderColorOne: Colors.white,
            type: GFLoaderType.custom,
            loaderColorTwo: Colors.white, // changed color to white
            child: Text('Loading ...',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}