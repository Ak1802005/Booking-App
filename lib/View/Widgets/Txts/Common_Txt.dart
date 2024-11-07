import 'package:flutter/material.dart';

class CommonTxt extends StatelessWidget {
  CommonTxt({super.key,required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.bodyLarge);
  }
}
