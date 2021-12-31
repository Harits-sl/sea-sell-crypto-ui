import 'package:flutter/material.dart';
import 'package:sea_sell_crypto/presentation/pages/home_page.dart';
import 'package:sea_sell_crypto/shared/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: whiteColor),
      home: const HomePage(),
    );
  }
}
