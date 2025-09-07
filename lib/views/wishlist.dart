import 'package:airbnbproject/provider/favouriteprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    final provider = Favouriteprovider.of(context);
    final favouriteitems = provider.favouriteid;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Edits",
                    style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  ),
                ),
                Text(
                  "WishList",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                favouriteitems.isEmpty
                    ? Text(
                        "No Favourites items yet",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.68,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                            ),
                            itemCount: favouriteitems.length,
                            itemBuilder: (context, index) {
                              final favourite = favouriteitems[index];
                              return FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection("myappcollection")
                                      .doc(favourite)
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (!snapshot.hasData ||
                                        snapshot.data == null) {
                                      return Center(
                                        child: Text("Error Loading Data"),
                                      );
                                    }
                                    var favoriteitem = snapshot.data;
                                    return Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  favoriteitem?["image"]),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 8,
                                            right: 8,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )),
                                        Positioned(
                                            left: 8,
                                            right: 8,
                                            bottom: 10,
                                            child: Container(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              padding: EdgeInsets.all(5),
                                              child: Text(
                                                favoriteitem?["title"],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                      ],
                                    );
                                  });
                            }),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
