import 'package:company_web_app/constant.dart';
import 'package:company_web_app/screens/home_page_mobile/body_widget_mobile.dart';
import 'package:company_web_app/screens/home_page_mobile/bottom_container_mobile.dart';
import 'package:company_web_app/screens/home_page_mobile/custom_list_view_mobile.dart';
import 'package:company_web_app/screens/witgets/animated_menu_slider.dart';
import 'package:flutter/material.dart';

class MobileScreenHomePage extends StatelessWidget {
  const MobileScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              sBackgroundColor,
              pBackgroundColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height / 1.5,
                child: Stack(
                  children: [
                    AnimatedMenuSlider(size: size),
                    MenuBottoms(size: size),
                  ],
                ),
              ),
              MobileBodyWidget(size: size),
              SizedBox(height: mediumPading),
              MobileCustomListViewWidget(
                size: size,
                pageController: _pageController,
              ),
              MobileBottomContainer(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
