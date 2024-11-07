import 'package:bookit/View/Widgets/Txts/Link_Txt.dart';
import 'package:flutter/material.dart';

class TxtBotton extends StatelessWidget {
  TxtBotton({super.key, required this.onPressed, required this.text});

  void Function()? onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: LinkTxt(text: text));
  }
}
