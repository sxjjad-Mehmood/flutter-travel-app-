import 'package:airbnbproject/components/currentlocation.dart';
import 'package:airbnbproject/components/customicon.dart';
import 'package:airbnbproject/components/stardisplay.dart';
import 'package:airbnbproject/provider/favouriteprovider.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Placedetailedscrren extends StatefulWidget {
  final DocumentSnapshot<Object?> place;
  // - DocumentSnapshot: Contains data read from a document, including its fields and metadata.
  // - Object?: This is the type of the data inside the document. Object? means it can be any type—or null.
  const Placedetailedscrren({super.key, required this.place});

  @override
  State<Placedetailedscrren> createState() => _PlacedetailedscrrenState();
}

class _PlacedetailedscrrenState extends State<Placedetailedscrren> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Favouriteprovider.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myplacepics(size, context, provider),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.place["title"],
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Room in ${widget.place["address"]}",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    Text(
                      "No of Beds ${widget.place["bed"]} and Bathroom${widget.place["bathroom"]}",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              widget.place["isActive"] == true
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.place["rating"].toString(),
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                              stardisplay(
                                rating: widget.place["rating"],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Image.network(
                                "https://wallpapers.com/images/high/golden-laurel-wreath-graphic-7ih1z0hhw6mqk95c-2.png",
                                height: 80,
                                width: 130,
                                color: Colors.amber,
                              ),
                              Positioned(
                                left: 45,
                                bottom: 30,
                                child: Text(
                                  "Guest\nFavourite",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                widget.place["reviews"].length.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                "Reviews",
                                style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                    height: 0.7),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.place["rating"].toString()} ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${widget.place["reviews"].length.toString()} reviews",
                            style: TextStyle(
                                fontSize: 17,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    mypropertylist(
                        size,
                        "https://tse1.mm.bing.net/th/id/OIP.mFa5vLi2rcCtGPIvsPaDCAHaE8?pid=Api&P=0&h=220",
                        "This rare to find",
                        "${widget.place["vendor"]}'s place is usually fully booked "),
                    Divider(),
                    mypropertylist(
                        size,
                        widget.place["image"],
                        "Stay with ${widget.place["vendor"]}",
                        "Superhosts  ${widget.place["yearOfHosting"]}"),
                    Divider(),
                    mypropertylist(
                        size,
                        "https://cdn-icons-png.flaticon.com/128/9215/9215678.png",
                        "Room in Rental Unit",
                        "your own room in home plus\n access into shared room"),
                    mypropertylist(
                        size,
                        "https://cdn-icons-png.flaticon.com/128/1965/1965701.png",
                        "Shared Common Spaces",
                        "you will share part of home with host ,"),
                    mypropertylist(
                        size,
                        "https://cdn-icons-png.flaticon.com/128/4556/4556725.png",
                        "Shared bathroom",
                        "you will share bathroom with other"),
                    Divider(),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "About this Place",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    ),
                    Divider(),
                    Text(
                      "where you'll be",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.place["address"]}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      width: size.width,
                      child: currentlocation(place: widget.place),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          height: size.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "\$${widget.place["price"]}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                        children: [
                          TextSpan(
                              text: " night",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ]),
                  ),
                  Text(
                    widget.place["date"],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.2,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Reserve",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }

  Padding mypropertylist(Size size, image, title, subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Divider(),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(image),
            radius: 28,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                subtitle,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: size.width * 0.034, color: Colors.grey.shade700),
              )
            ],
          ))
        ],
      ),
    );
  }

  Stack myplacepics(Size size, BuildContext context, provider) {
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.35,
          child: AnotherCarousel(
            images: widget.place["imageUrls"]
                .map((url) => NetworkImage(url))
                .toList(),
            showIndicator: false,
            dotBgColor: Colors.transparent,
            onImageChange: (p0, p1) {
              setState(() {
                currentindex = p1;
              });
            },
            autoplay: true,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black45),
          child: Text(
            "${currentindex + 1} /${widget.place["imageUrls"].length}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
        )),
        Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: customicons(radius: 15, icon: Icons.arrow_back)),
                SizedBox(
                  width: size.width * 0.55,
                ),
                customicons(radius: 15, icon: Icons.shape_line_outlined),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    provider.togglefavourite(widget.place);
                  },
                  child: customicons(
                    radius: 15,
                    icon: provider.isExist(widget.place)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: provider.isExist(widget.place)
                        ? Colors.red
                        : Colors.black26,
                  ),
                )
              ],
            ))
      ],
    );
  }
}
