import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// margin
double defaultMargin = 24.0;

// color
Color blackColor = const Color(0xff17161B);
Color whiteColor = const Color(0xffFFFFFF);
Color grayColor = const Color(0xff6A6C7C);
Color purpleColor = const Color(0xff5A1FE4);
Color yellowColor = const Color(0xffD5F566);
Color brownColor = const Color(0xff414B1A);
Color pinkColor = const Color(0xffE41F89);
Color lightGrayColor = const Color(0xffA1A1B1);
Color darkBlueColor = const Color(0xff18093A);

// TextStyle
TextStyle blackTextStyle = GoogleFonts.poppins(color: blackColor);
TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);
TextStyle grayTextStyle = GoogleFonts.poppins(color: grayColor);
TextStyle brownTextStyle = GoogleFonts.poppins(color: brownColor);

// fontWeight
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

// boxShadow
BoxShadow primaryBoxSadow = BoxShadow(
  color: lightGrayColor.withOpacity(0.35),
  blurRadius: 15,
  offset: const Offset(0, 5),
);
