// ignore_for_file: file_names

import 'package:bookit/View/Widgets/Txts/Common_Txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  CustomListView(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.title});

  void Function()? onTap;
  String title;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, size: 30),
      title: CommonTxt(
        text: title,
      ),
      trailing: const Icon(
        CupertinoIcons.right_chevron,
        size: 30,
      ),
    );
  }
}
