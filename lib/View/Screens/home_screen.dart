// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:bookit/Constant/Strings/listConst.dart';
import 'package:bookit/Constant/Strings/stringConst.dart';
import 'package:bookit/View/Widgets/Listview/List_View.dart';
import 'package:bookit/View/Widgets/Txts/Common_Txt.dart';
import 'package:bookit/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatelessWidget with ListConst {
  HomeScreen({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Confirm Exit'),
            content: Text('Are You Want To Close This App ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true), // Exit
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height.toDouble();
    final width = MediaQuery.sizeOf(context).width.toDouble();
    final GlobalKey key = GlobalKey();
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
          body: SliderDrawer(
        key: key,
        isCupertino: true,
        isDraggable: true,
        splashColor: Colors.white38,
        appBar: SliderAppBar(
          appBarColor: Colors.white,
          title: Text('Book It',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
          isTitleCenter: true,
          trailing: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GFIconButton(
                color: Colors.black,
                type: GFButtonType.transparent,
                icon: Icon(Icons.qr_code_scanner_rounded),
                onPressed: () => print('Qr Code')),
          ),
        ),
        slider: Container(
          color: Color(0xFFC5D3E8),
          child: Column(children: [
            30.vertical(),
            GFAvatar(
              size: 50,
              backgroundImage: NetworkImage(StringConsts.avatarLogo.value),
            ),
            10.vertical(),
            CommonTxt(text: 'Name'),
            CommonTxt(text: 'Email'),
            10.vertical(),
            SizedBox(
              height: height * 0.79,
              child: ListView.builder(
                itemCount: profileDetails.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xFFF3F3E0),
                    elevation: 30,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CustomListView(
                      onTap: () => Navigator.pushNamed(
                          context, StringConsts.bookingScreen.value),
                      title: profileDetails.elementAt(index),
                      icon: Icons.format_list_bulleted,
                    ),
                  );
                },
              ),
            )
          ]),
        ),
        child: Column(
          children: [
            10.vertical(),
            CarouselSlider(
              options: CarouselOptions(
                  height: 400.0,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInExpo,
                  scrollPhysics: AlwaysScrollableScrollPhysics()),
              items: carouselImg.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        clipBehavior: Clip.antiAlias,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Image.network(i, fit: BoxFit.cover));
                  },
                );
              }).toList(),
            )
          ],
        ),
      )),
    );
  }
}
