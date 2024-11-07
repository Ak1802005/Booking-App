import 'package:bookit/View/Widgets/Buttons/Txt_Botton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class InfinatewidthButton extends StatelessWidget {
  InfinatewidthButton({super.key, required this.onPressed, required this.text});

  void Function()? onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 42,
        width: double.infinity,
        child: GFButton(
          onPressed: onPressed,
          text: text,
          type: GFButtonType.solid,
          elevation: 25,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          color: Colors.blue,
        ));
  }
}
