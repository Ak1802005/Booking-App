// ignore_for_file: file_names

enum StringConsts {
  // All Routes Of Class
  splashScreen('/splashRoute'),
  homeScreen('/homeRoute'),
  registeration('/registerRoute'),
  otpVerification('/otpVeri'),
  login('/login'),
  profile('/profile'),
  bookingScreen('/booking'),
  personalInfo('/pi'),
  passengerScreen('/passenger'),

  //All Images URL
  googleLogo(
      'https://e1.pxfuel.com/desktop-wallpaper/104/435/desktop-wallpaper-google-black-backgrounds-2-google-logo-black-background-thumbnail.jpg'),
  avatarLogo('https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg'),
  facbookLogo(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTybUzajYuJIyN3hQRk93vwk1i3H5qAX4GOFA&s'),
  iphoneLogo(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWwLfnYx1uGjwly9-eS0y7f2TyAPVcD-aGiHxD42DCBILJ9qMK03uc22uZnwql_Ay2GB4&usqp=CAU'),
  registerImg(
      'https://cdni.iconscout.com/illustration/premium/thumb/freelancer-working-on-laptop-5670856-4722553.png'),
  loginImg('lib/Asset/Character-working-laptop-sitting-chair.png'),

  //Link Txts
  logInLink('Click Here.'),
  registerBtn('Register'),
  loginBtn('Log In'),
  registerLink('Register Here.'),

  //Common Txts
  registerLogMsg('Are You Already Registered ?'),
  loginRegMsg('Are You New User ?'),
  registerLogo('Also Log In With This !');

  final String value;

  const StringConsts(this.value);
}
