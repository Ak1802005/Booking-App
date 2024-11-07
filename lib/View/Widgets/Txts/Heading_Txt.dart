import 'package:flutter/material.dart';

class HeadingTxt extends StatelessWidget {
  HeadingTxt({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headlineMedium);
  }
}
