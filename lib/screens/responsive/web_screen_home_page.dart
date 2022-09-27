import 'package:company_web_app/constant.dart';
import 'package:company_web_app/screens/home_page_web/body_widget_web.dart';
import 'package:company_web_app/screens/home_page_web/bottom_container_web.dart';
import 'package:company_web_app/screens/home_page_web/custom_list_view_web.dart';
import 'package:company_web_app/screens/witgets/web_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebScreenHomePage extends StatefulWidget {
  const WebScreenHomePage({Key? key}) : super(key: key);

  @override
  State<WebScreenHomePage> createState() => _WebScreenHomePageState();
}

class _WebScreenHomePageState extends State<WebScreenHomePage> {
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
                    WebMenuWidget(size: size),
                    WebMenuBottoms(size: size),
                  ],
                ),
              ),
              const WebBodyWidget(),
              WebCustomListViewWidget(
                size: size,
                pageController: _pageController,
              ),
              WebBottomContainer(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
