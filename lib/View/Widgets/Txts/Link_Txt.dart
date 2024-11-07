import 'package:flutter/material.dart';

class LinkTxt extends StatelessWidget {
  LinkTxt({super.key,required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.blue));
  }
}
