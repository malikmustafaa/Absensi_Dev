import 'package:flutter/material.dart';

// global colors
const defaultColor = Color.fromRGBO(97, 6, 165, 1.0);
const default2Color = Color(0xff1815a4);
const defaultBgColor = Color(0xFFF3E5F5);
const defaultc200Color = Color(0xFFCE93D8);
const blackColor = Color(0xFF000000);
const greyBgColor = Color(0xFFE0E0E0);
const black87Color = Color(0xDD000000);
const black38Color = Color(0x61000000);
const black12Color = Color(0x1F000000);
const redColor = Color(0xFFF44336);
Color orangeColor = const Color(0xFFFF9800);
const whiteColor = Color(0xFFF5F5F5);

const thirdy = Color.fromRGBO(0, 130, 74, 1);
const bgAlertOTP = Color.fromARGB(255, 205, 13, 13);
const warning = Color.fromRGBO(242, 153, 74, 1);
const silver2 = Color.fromARGB(77, 181, 166, 166);

Color getDynamicColor(String status) {
  if (status == '1') {
    return thirdy;
  }
  if (status == '2') {
    return bgAlertOTP;
  }
  if (status == '3') {
    return warning;
  }
  if (status == '4') {
    return silver2;
  }
  return blackColor; //default color.
}

var ttlStyle = const TextStyle(
    fontWeight: FontWeight.bold, color: blackColor, fontSize: 36);
var accountStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w400,
    color: blackColor,
    fontSize: 14);

var tfStyle = const TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18,
);
var subttlStyle = const TextStyle(
    fontWeight: FontWeight.bold, color: black87Color, fontSize: 13);
var pleacehStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
var valStyle = const TextStyle(color: black38Color);
var borderStyle = const BorderSide(color: black12Color);
var alerttextStyle = const TextStyle(
    fontWeight: FontWeight.w500, fontSize: 16, color: whiteColor);
var alerttextdescStyle = const TextStyle(
    fontWeight: FontWeight.w500, fontSize: 16, color: black87Color);
var alertttlStyle = const TextStyle(fontWeight: FontWeight.w700, fontSize: 22);
var singupStyle = const TextStyle(fontWeight: FontWeight.bold, color: redColor);
var infosingupStyle = const TextStyle(fontWeight: FontWeight.bold);
var singinStyle = const TextStyle(fontWeight: FontWeight.bold, color: redColor);
var infosinginStyle = const TextStyle(fontWeight: FontWeight.bold);
var registertextStyle =
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 22);
var textFieldStyle = const TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  fontSize: 16,
);
var buttonLoginStyle = const TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  fontSize: 18,
);
var buttonRegisterStyle = const TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  fontSize: 18,
);
var buttonKehadiranStyle = const TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  fontSize: 18,
);
var registerStyle = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: orangeColor,
);
var loginStyle = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: orangeColor,
);
var jamterakhirStyle = const TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 16,
  fontWeight: FontWeight.w400,
);
var usernameStyle = const TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
var fullnameStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    color: whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w600);

var mobileStyle = const TextStyle(
    color: whiteColor, fontSize: 12, fontWeight: FontWeight.w600);

var buttonRefreshStyle = const TextStyle(
    color: default2Color,
    fontFamily: 'Ubuntu',
    fontSize: 16,
    fontWeight: FontWeight.w700);
var texttanyaStyle = const TextStyle(
    fontFamily: 'Ubuntu', fontSize: 20, fontWeight: FontWeight.w700);
var textAkurasiStyle = const TextStyle(
    fontFamily: 'Ubuntu', fontSize: 16, fontWeight: FontWeight.w400);
var buttonYaStyle = const TextStyle(
    color: whiteColor,
    fontFamily: 'Ubuntu',
    fontSize: 16,
    fontWeight: FontWeight.w700);

var buttonDisable = const TextStyle(
    color: whiteColor,
    fontFamily: 'Ubuntu',
    fontSize: 12,
    fontWeight: FontWeight.w500);

var textJamMasukStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    color: default2Color,
    fontSize: 16,
    fontWeight: FontWeight.w600);

var textTglMasukStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    color: blackColor,
    fontSize: 14,
    fontWeight: FontWeight.w700);

var textJmMasukStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    color: blackColor,
    fontSize: 22,
    fontWeight: FontWeight.w700);
var textfllnamepengaturanStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    color: default2Color,
    fontSize: 16,
    fontWeight: FontWeight.w600);
var textEmailpengaturanStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400);

var textEmailDetailProfileStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    color: blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w600);

var textDetailPrflepengaturanStyle = const TextStyle(
    fontFamily: 'Ubuntu',
    color: default2Color,
    fontSize: 16,
    fontWeight: FontWeight.w600);

var styleTitleAppBar = const TextStyle(
    color: whiteColor,
    fontFamily: 'Ubuntu',
    fontSize: 22,
    fontWeight: FontWeight.w600);

var styleTitleAppBarBlack = const TextStyle(
    color: default2Color,
    fontFamily: 'Ubuntu',
    fontSize: 22,
    fontWeight: FontWeight.w600);
