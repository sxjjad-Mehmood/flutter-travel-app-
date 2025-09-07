import 'package:airbnbproject/provider/favouriteprovider.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../views/detailedscreen.dart';

class displayimage extends StatefulWidget {
  const displayimage({super.key});

  @override
  State<displayimage> createState() => _displayimageState();
}

class _displayimageState extends State<displayimage> {
  final CollectionReference placereferance =
      FirebaseFirestore.instance.collection("myappcollection");
  @override
  Widget build(BuildContext context) {
    final provider = Favouriteprovider.of(context);
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: placereferance.snapshots(),
        builder: (context, streamsnapshot) {
          if (streamsnapshot.hasData) {
            return ListView.builder(
                itemCount: streamsnapshot.data!.docs.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final place = streamsnapshot.data!.docs[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox(
                                  height: 250,
                                  child: AnotherCarousel(
                                    images: place['imageUrls']
                                        .map((url) => NetworkImage(url))
                                        .toList(),
                                    dotSize: 6,
                                    dotBgColor: Colors.transparent,
                                    indicatorBgPadding: 5,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 15,
                                right: 15,
                                child: Row(
                                  children: [
                                    place["isActive"] == true
                                        ? Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              child: Text(
                                                "Guest Favorite",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            width: size.width * 0.03,
                                          ),
                                    Spacer(),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.white,
                                          size: 34,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            provider.togglefavourite(place);
                                          },
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: provider.isExist(place)
                                                ? Colors.red
                                                : Colors.black26,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                place["address"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              Spacer(),
                              Icon(Icons.star),
                              SizedBox(
                                width: 5,
                              ),
                              Text(place["rating"].toString())
                            ],
                          ),
                          Text(
                            "Stay with ${place["vendor"]} ,${place["vendorProfession"]}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            place["date"],
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(
                            height: size.height * 0.007,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "\$${place["price"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: " night ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal))
                                ]),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Placedetailedscrren(
                                      place: place,
                                    )));
                      },
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator(
              color: Colors.pink,
            );
          }
        });
  }
}
