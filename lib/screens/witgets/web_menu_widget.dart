import 'dart:async';

import 'package:company_web_app/constant.dart';
import 'package:company_web_app/home_page.dart';
import 'package:company_web_app/screens/contact/contact_home_page.dart';
import 'package:company_web_app/screens/witgets/custom_clip_path.dart';
import 'package:company_web_app/screens/witgets/social_icon_widget.dart';
import 'package:flutter/material.dart';

class WebMenuBottoms extends StatelessWidget {
  const WebMenuBottoms({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: smallPading),
      child: Container(
        color: Colors.transparent,
        height: size.height / 5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: (size.width / 6) / 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: smallPading),
                    const SocialIconWidget(
                        imageNetwork:
                            'https://cdn-icons-png.flaticon.com/128/2111/2111463.png',
                        urlNetwork:
                            'https://www.instagram.com/onurcebeciiiii/'),
                    SizedBox(width: mediumPading),
                    const SocialIconWidget(
                        imageNetwork:
                            'https://cdn-icons-png.flaticon.com/128/733/733547.png',
                        urlNetwork: 'https://tr-tr.facebook.com/'),
                    SizedBox(width: mediumPading),
                    const SocialIconWidget(
                        urlNetwork: "https://twitter.com/?logout=1663956593392",
                        imageNetwork:
                            'https://cdn-icons-png.flaticon.com/128/733/733579.png'),
                    SizedBox(width: mediumPading),
                    const SocialIconWidget(
                        urlNetwork:
                            "https://www.linkedin.com/in/onur-cebeci-a44394242/",
                        imageNetwork:
                            'https://cdn-icons-png.flaticon.com/512/3536/3536505.png'),
                    SizedBox(width: mediumPading),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    height: 120,
                    width: 250,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      },
                      child: const Text(
                        'Home Page',
                        style: textStyle,
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ContactHomePage()));
                      },
                      child: const Text(
                        'Contact',
                        style: textStyle,
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text('#3', style: textStyle)),
                  TextButton(
                      onPressed: () {},
                      child: const Text('#4', style: textStyle)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WebMenuWidget extends StatelessWidget {
  const WebMenuWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_controller.page != 2) {
        _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInQuad);
      } else {
        _controller.jumpToPage(0);
      }
    });
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        color: Colors.transparent,
        height: size.height / 1.5,
        width: size.width,
        child: PageView(
          controller: _controller,
          children: [
            Image.network(
              'https://images.pexels.com/photos/188035/pexels-photo-188035.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://images.pexels.com/photos/224924/pexels-photo-224924.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://images.pexels.com/photos/6794970/pexels-photo-6794970.jpeg?auto=compress&cs=tinysrgb&w=1600',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
