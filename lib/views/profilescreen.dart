import 'package:airbnbproject/views/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    size: 35,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black54,
                    backgroundImage: NetworkImage(
                        "${FirebaseAuth.instance.currentUser!.photoURL}"),
                  ),
                  SizedBox(
                    width: size.width * 0.06,
                  ),
                  Text.rich(
                    TextSpan(
                        text:
                            "${FirebaseAuth.instance.currentUser!.displayName}\n",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Show Profile",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16))
                        ]),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_back_ios),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Divider(
                color: Colors.black12,
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                color: Colors.white54,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(
                            text: "Travel you Place\n",
                            style: TextStyle(
                                height: 2.5,
                                fontSize: 18,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text:
                                      "it's simple to get set up and\n start earning",
                                  style: TextStyle(
                                      height: 1.2,
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400))
                            ]),
                      ),
                      Spacer(),
                      Image.network(
                        "https://img.freepik.com/premium-photo/house-vector-flat-icon_917213-66227.jpg",
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black12,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Setting",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              profileinfo(Icons.person_2_outlined, "Personal Information"),
              profileinfo(Icons.security_outlined, "login & Security"),
              profileinfo(Icons.payment_outlined, "Payment and Payout"),
              profileinfo(Icons.settings_outlined, "Accessibility"),
              profileinfo(Icons.translate_outlined, "Translation"),
              profileinfo(Icons.notifications_active_sharp, "Notification"),
              profileinfo(Icons.lock_outline, "Privacy and Sharing"),
              profileinfo(Icons.card_travel_outlined, "Travel for Work"),
              SizedBox(
                height: 15,
              ),
              Text(
                "Hosting",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              SizedBox(
                height: 25,
              ),
              profileinfo(Icons.add_home, "List your Space"),
              profileinfo(Icons.home_outlined, "Learn about hosting"),
              SizedBox(
                height: 15,
              ),
              Text(
                "Support",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              SizedBox(
                height: 25,
              ),
              profileinfo(Icons.help_outline, "Visit the Help Center"),
              profileinfo(
                  Icons.health_and_safety, "Get help with safert issue"),
              profileinfo(Icons.ac_unit, "How Traveller work"),
              profileinfo(Icons.edit, "Give as Feedback"),
              SizedBox(
                height: 15,
              ),
              Text(
                "Legal",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              SizedBox(
                height: 25,
              ),
              profileinfo(Icons.menu_book_outlined, "Terms of services"),
              profileinfo(Icons.one_k_plus_sharp, "Privacy and Policy"),
              profileinfo(Icons.safety_divider_rounded, "Open Source License"),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginscreen()));
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.black12,
              ),
              Text(
                "Version 24.5 (28004912)",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Padding profileinfo(icon, name) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 35,
                color: Colors.black.withOpacity(0.7),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 17),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Divider(
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
