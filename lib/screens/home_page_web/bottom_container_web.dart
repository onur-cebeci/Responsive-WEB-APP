import 'package:company_web_app/constant.dart';
import 'package:flutter/material.dart';

class WebBottomContainer extends StatelessWidget {
  const WebBottomContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 3,
      width: size.width,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            height: 150,
            width: 220,
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(height: smallPading),
                  SizedBox(
                    width: size.width / 4,
                    child: const Text(
                      " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      SizedBox(width: smallPading),
                      const Text('Email : .......@gmail.com'),
                    ],
                  ),
                  SizedBox(height: mediumPading),
                  Row(children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    SizedBox(width: smallPading),
                    const Text('Phone : --  --------------------'),
                  ]),
                ],
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
