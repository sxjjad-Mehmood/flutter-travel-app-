import 'package:airbnbproject/components/Totalprice.dart';
import 'package:airbnbproject/components/displayimage.dart';
import 'package:airbnbproject/components/mapwithcustomwindowinfo.dart';
import 'package:airbnbproject/components/searchfilter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Explorescreen extends StatefulWidget {
  const Explorescreen({super.key});

  @override
  State<Explorescreen> createState() => _ExplorescreenState();
}

class _ExplorescreenState extends State<Explorescreen> {
  final CollectionReference categoryreference =
      FirebaseFirestore.instance.collection("mycategory");
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              searchfilter(),
              StreamBuilder(
                  stream: categoryreference.snapshots(),
                  builder: (context, streamsnapshot) {
                    if (streamsnapshot.hasData) {
                      return Stack(
                        children: [
                          Positioned(
                              right: 0,
                              left: 0,
                              top: 80,
                              child: Divider(
                                color: Colors.black12,
                              )),
                          SizedBox(
                            height: size.height * 0.12,
                            child: ListView.builder(
                                itemCount: streamsnapshot.data!.docs.length,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedindex = index;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 20, right: 20, left: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle),
                                            child: Image.network(
                                              streamsnapshot.data!.docs[index]
                                                  ['image'],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              streamsnapshot.data!.docs[index]
                                                  ["title"],
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: selectedindex == index
                                                    ? Colors.black
                                                    : Colors.black45,
                                              )),
                                          Container(
                                            height: 3,
                                            width: 20,
                                            color: selectedindex == index
                                                ? Colors.black
                                                : Colors.black45,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.pink,
                      ),
                    );
                  }),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    totalprice(),
                    SizedBox(
                      height: 10,
                    ),
                    displayimage()
                  ],
                ),
              ))
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: MapWithCustomInfoWindow());
  }
}
