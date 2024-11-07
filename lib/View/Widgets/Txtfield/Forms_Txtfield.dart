// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FormsTxtField extends StatelessWidget {
  FormsTxtField(
      {super.key,
      required this.width,
      required this.controller,
      required this.hintTxt,
      this.errTxt,
      this.icon});

  TextEditingController controller;
  String hintTxt;
  String? errTxt;
  double width;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          border: Border.all(width: 2.5, color: Colors.blue),
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: const Color(0xFF071952)),
        controller: controller,
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
            contentPadding: const EdgeInsetsDirectional.all(13),
            hintText: hintTxt,
            errorText: errTxt,
            border: InputBorder.none,
            prefixIcon: Icon(icon, size: 25, color: const Color(0xFF295F98))),
      ),
    );
  }
}
