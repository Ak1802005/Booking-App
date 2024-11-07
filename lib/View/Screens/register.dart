// ignore_for_file: use_build_context_synchronously

import 'package:bookit/Constant/Strings/stringConst.dart';
import 'package:bookit/View/Screens/otp_verification.dart';
import 'package:bookit/View/Widgets/Buttons/Img_Button.dart';
import 'package:bookit/View/Widgets/Buttons/Txt_Botton.dart';
import 'package:bookit/View/Widgets/Txts/Common_Txt.dart';
import 'package:bookit/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Widgets/Buttons/InfinateWidth_Button.dart';
import '../Widgets/Txtfield/Forms_Txtfield.dart';

class Registeration extends StatelessWidget {
  const Registeration({super.key});

  @override
  Widget build(BuildContext context) {
    final number = TextEditingController();
    final email = TextEditingController();
    final demo = TextEditingController();
    final height = MediaQuery.sizeOf(context).height.toDouble();
    final width = MediaQuery.sizeOf(context).width.toDouble();
    return Scaffold(
      backgroundColor: const Color(0xFFFFD7C4),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.vertical(),
              Center(
                  child: Image.network(StringConsts.registerImg.value,
                      height: height * 0.29)),
              20.vertical(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FormsTxtField(
                      width: width * 0.43,
                      controller: demo,
                      hintTxt: 'Firstname',
                      icon: Icons.person),
                  FormsTxtField(
                      width: width * 0.43,
                      controller: demo,
                      hintTxt: 'Lastname',
                      icon: Icons.person),
                ],
              ),
              10.vertical(),
              FormsTxtField(
                width: width * 0.88,
                controller: email,
                hintTxt: 'E - mail',
                icon: Icons.email,
              ),
              10.vertical(),
              FormsTxtField(
                width: width * 0.88,
                controller: number,
                hintTxt: 'Phone number',
                icon: Icons.call,
              ),
              10.vertical(),
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
              ),
              20.vertical(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child:
                          CommonTxt(text: StringConsts.registerLogMsg.value)),
                  TxtBotton(
                      onPressed: () => Navigator.pushNamed(context,StringConsts.login.value),
                      text: StringConsts.logInLink.value)
                ],
              ),
              20.vertical(),
              CommonTxt(text: StringConsts.registerLogo.value),
              15.vertical(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImgButton(
                      link: StringConsts.googleLogo.value,
                      onTap: () => signInWithGoogle(context)),
                  ImgButton(
                      link: StringConsts.facbookLogo.value,
                      onTap: () => signInWithFacebook()),
                  ImgButton(
                      link: StringConsts.iphoneLogo.value,
                      onTap: () => signInWithFacebook())
                ],
              ),
              40.vertical(),
              InfinatewidthButton(
                  onPressed: () {
                    emailAuthentication(email.text.trim());
                    phoneAuthentication(context, number.text.trim());
                  },
                  text: StringConsts.registerBtn.value)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> phoneAuthentication(BuildContext context, String number) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+91 ${number.toString()}',
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OTPVerification(verificationIds: verificationId)));
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        print('Congr0!!!');
      },
      verificationFailed: (FirebaseAuthException error) {
        print('Lundo $error}');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void emailAuthentication(String email) {
    var acs = ActionCodeSettings(
        url: 'https://www.example.com/finishSignUp?cartId=1234',
        handleCodeInApp: true,
        iOSBundleId: 'com.example.ios',
        androidPackageName: 'com.example.android',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '12');

    var emailAuth = email;
    FirebaseAuth.instance
        .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs)
        .catchError(
            (onError) => print('Error sending email verification $onError'))
        .then((value) => print('Successfully sent email verification $email'));
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    Navigator.pushReplacementNamed(context, StringConsts.homeScreen.value);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
