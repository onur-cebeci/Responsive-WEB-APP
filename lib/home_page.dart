import 'package:company_web_app/constant.dart';
import 'package:company_web_app/screens/responsive/mobile_screen_home_page.dart';
import 'package:company_web_app/screens/responsive/web_screen_home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size.width <= mobileSize
        ? const MobileScreenHomePage()
        : const WebScreenHomePage();
  }
}
