import 'package:flutter/material.dart';

class ImgButton extends StatelessWidget {
  ImgButton({super.key, required this.link, this.onTap});

  String link;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    link,
                  ),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover),
              shape: BoxShape.circle),
        ));
  }
}
