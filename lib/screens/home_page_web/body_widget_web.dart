import 'package:company_web_app/constant.dart';
import 'package:company_web_app/screens/witgets/custom_clip_path.dart';
import 'package:company_web_app/screens/witgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class WebBodyWidget extends StatelessWidget {
  const WebBodyWidget({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: Colors.transparent,
                height: size.height / 1.5,
                width: size.width,
                child: Image.asset(
                  "assets/laptop.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: mediumPading,
                right: size.width / 2,
                child: const Text('Projects', style: textStyleTitle)),
            Positioned(
              top: (size.height / 2) / 3,
              width: size.width / 2,
              child: Column(
                children: [
                  const Text('Solutions that are specialized for you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey)),
                  const Text('Let\'s solve it together',
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue)),
                  SizedBox(height: mediumPading),
                  Container(
                    height: 50,
                    width: size.width / 4,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(42),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(smallPading),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.adjust,
                              color: Colors.blue,
                            ),
                            SizedBox(width: smallPading),
                            const Text(
                              'Solutions Types',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: mediumPading),
                  Padding(
                    padding: EdgeInsets.only(left: size.width / 12),
                    child: SizedBox(
                      width: size.width / 3,
                      child: const Text(
                          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour',
                          textAlign: TextAlign.start,
                          style: secondTextStyle),
                    ),
                  ),
                  SizedBox(
                    height: (size.height / 2) / 14,
                  ),
                  CustomTextButton(
                      widthLenght: 3,
                      size: size,
                      buttonText: buttonText,
                      text: 'Exam Type 1 Solution'),
                  CustomTextButton(
                      widthLenght: 3,
                      size: size,
                      buttonText: buttonText,
                      text: 'Exam Type 2 Solution'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
