import 'package:bookit/View/Widgets/Buttons/Txt_Botton.dart';
import 'package:bookit/View/Widgets/Txtfield/Forms_Txtfield.dart';
import 'package:bookit/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OTPVerification extends StatelessWidget {
  OTPVerification({super.key, required this.verificationIds});

  String verificationIds;

  @override
  Widget build(BuildContext context) {
    final otpNum = TextEditingController();
    final height = MediaQuery.sizeOf(context).height.toDouble();
    final width = MediaQuery.sizeOf(context).width.toDouble();
    return Scaffold(
      backgroundColor: const Color(0xFFFFD7C4),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormsTxtField(
                  width: width * 0.88,
                  controller: otpNum,
                  hintTxt: 'Enter Your OTP :',
                  icon: Icons.verified),
              20.vertical(),
              TxtBotton(
                text: 'Verification',
                onPressed: () {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationIds,
                      smsCode: otpNum.text.trim().toString());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}
