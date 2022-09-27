import 'dart:convert';

import 'package:company_web_app/constant.dart';
import 'package:company_web_app/screens/home_page_mobile/bottom_container_mobile.dart';
import 'package:company_web_app/screens/home_page_web/bottom_container_web.dart';
import 'package:company_web_app/screens/witgets/animated_menu_slider.dart';
import 'package:company_web_app/screens/witgets/google_map.dart';
import 'package:company_web_app/screens/witgets/web_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactHomePage extends StatefulWidget {
  const ContactHomePage({Key? key}) : super(key: key);

  @override
  State<ContactHomePage> createState() => _ContactHomePageState();
}

class _ContactHomePageState extends State<ContactHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController subject = TextEditingController();
    TextEditingController message = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          color: pBackgroundColor,
          child: Column(
            children: [
              SizedBox(
                height: size.height / 1.5,
                child: size.width <= mobileSize
                    ? Stack(
                        children: [
                          AnimatedMenuSlider(size: size),
                          MenuBottoms(size: size),
                        ],
                      )
                    : Stack(
                        children: [
                          WebMenuWidget(size: size),
                          WebMenuBottoms(size: size),
                        ],
                      ),
              ),
              SizedBox(height: size.height / 15),
              Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.leaderboard),
                  SizedBox(width: smallPading),
                  const Text(
                    'Contact Us',
                    style: textStyleTitle,
                  ),
                ],
              )),
              SizedBox(height: size.height / 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width / 4.5),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        SizedBox(
                            width: size.width / 6,
                            child: Container(
                              child: TextFormField(
                                controller: name,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blueGrey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blueAccent)),
                                  hintText: 'Name',
                                ),
                                autofocus: true,
                                cursorColor: Colors.blueAccent,
                              ),
                            )),
                        const Spacer(),
                        SizedBox(
                          width: size.width / 6,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            decoration: const InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueAccent)),
                              hintText: '____@gmail.com',
                            ),
                            autofocus: true,
                            cursorColor: Colors.blueAccent,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: size.width / 6,
                          child: TextFormField(
                            controller: name,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueAccent)),
                              hintText: 'Phone',
                            ),
                            autofocus: true,
                            cursorColor: Colors.blueAccent,
                          ),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                    SizedBox(height: mediumPading),
                    Container(
                      height: (size.height / 2) / 4,
                      width: size.width / 1.9,
                      child: TextFormField(
                        controller: message,
                        expands: true,
                        maxLines: null,
                        maxLength: 120,
                        decoration: const InputDecoration(
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                          hintText: 'Message',
                        ),
                        cursorColor: Colors.white70,
                      ),
                    ),
                    SizedBox(height: mediumPading),
                    MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          sendEmail(
                              email: email.text.trim(),
                              name: name.text.trim(),
                              message: message.text.trim(),
                              subject: subject.text.trim());
                        });
                      },
                      height: 70,
                      minWidth: 140,
                      child: const Text('SEND'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mediumPading),
              GoogleMapWidget(
                size: size,
              ),
              size.width <= mobileSize
                  ? MobileBottomContainer(size: size)
                  : WebBottomContainer(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

Future sendEmail({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async {
  const serviceId = 'serviceId';
  const templateId = 'templateId';
  const userId = 'userId';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      }));
}
