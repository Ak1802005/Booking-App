import 'package:bookit/main.dart';
import 'package:flutter/material.dart';

import '../../Constant/Strings/stringConst.dart';
import '../Widgets/Buttons/InfinateWidth_Button.dart';
import '../Widgets/Buttons/Txt_Botton.dart';
import '../Widgets/Txtfield/Forms_Txtfield.dart';
import '../Widgets/Txts/Common_Txt.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final demo = TextEditingController();
    final height = MediaQuery.sizeOf(context).height.toDouble();
    final width = MediaQuery.sizeOf(context).width.toDouble();
    return Scaffold(
      backgroundColor: const Color(0xFFFFD7C4),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            50.vertical(),
            Center(
                child: Image.asset(StringConsts.loginImg.value,
                    height: height * 0.30)),
            20.vertical(),
            FormsTxtField(
              width: width * 0.88,
              controller: demo,
              hintTxt: 'Username',
              icon: Icons.person_pin_rounded,
            ),
            10.vertical(),
            FormsTxtField(
              width: width * 0.88,
              controller: demo,
              hintTxt: 'Password',
              icon: Icons.password,
            ),20.vertical(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child:
                    CommonTxt(text: StringConsts.loginRegMsg.value)),
                TxtBotton(
                    onPressed: () => Navigator.pushNamed(context,StringConsts.registeration.value),
                    text: StringConsts.registerLink.value)
              ],
            ),
            40.vertical(),
            InfinatewidthButton(
                onPressed: () {
                  // emailAuthentication(email.text.trim());
                  // phoneAuthentication(context, number.text.trim());
                },
                text: StringConsts.loginBtn.value)
          ],
        ),
      ),

    );
  }
}
