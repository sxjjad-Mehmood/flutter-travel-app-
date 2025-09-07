import 'package:airbnbproject/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../authentication/googleauthentication.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Log in or signup",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.black45,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to Traveller",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: size.width,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "country/region",
                                style: TextStyle(color: Colors.black45),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "pakistan (+92)",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black45),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                    text:
                        "we'll call or text you to confirm number. Standart message and data rates apply ",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                          text: "privacy policy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline))
                    ],
                  )),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pinkAccent),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.026,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.black,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "or",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.016,
                  ),
                  socailicon(size, Icons.facebook, "Continue with Facebook", 25,
                      Colors.blue),
                  InkWell(
                    onTap: () async {
                      await Firebaseauthservice().sigingoogle();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homescreen()));
                    },
                    child: socailicon(size, FontAwesomeIcons.google,
                        "Continue with Google", 27, Colors.red),
                  ),
                  socailicon(size, Icons.apple, "Continue with Apple", 30,
                      Colors.black),
                  socailicon(size, Icons.email_outlined, "Continue with Email",
                      30, Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Need help",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  Padding socailicon(Size size, icon, name, double iconsize, color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.05,
            ),
            Icon(
              icon,
              color: color,
              size: iconsize,
            ),
            SizedBox(
              width: size.width * 0.18,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
