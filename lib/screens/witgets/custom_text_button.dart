import 'package:company_web_app/constant.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.size,
    required TextStyle buttonText,
    required this.text,
    required this.widthLenght,
  })  : _buttonText = buttonText,
        super(key: key);

  final Size size;
  final TextStyle _buttonText;
  final String text;
  final int widthLenght;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width / 12),
      child: SizedBox(
        height: 50,
        width: size.width / widthLenght,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(42),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey.shade100),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.adjust,
                ),
                SizedBox(width: smallPading),
                Text(
                  text,
                  style: _buttonText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
