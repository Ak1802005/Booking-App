import 'package:flutter/material.dart';

class IconsButton extends StatelessWidget {
  IconsButton({super.key, required this.icon, required this.onPressed});

  void Function()? onPressed;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon, size: 25));
  }
}
