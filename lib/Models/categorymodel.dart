import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> savecategory() async {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection("mycategory");
  for (final Category category in categorieslist) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    ref.doc("das");
    await ref.doc(id).set(category.toMap());
  }
}

class Category {
  final String title;
  final String image;
  Category({required this.title, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, "image": image};
  }
}

List<Category> categorieslist = [
  Category(
    title: "Luxury Homes",
    image:
        "https://media.istockphoto.com/id/477756489/photo/illuminated-house-with-pond-in-foreground.jpg?s=1024x1024&w=is&k=20&c=1N3nYKzvY1EQkYF6jLyUsC_5Y0Z_Y3bV-KKxzO0-mOA=",
  ),
  Category(
    title: "Mountain Retreats",
    image:
        "https://plus.unsplash.com/premium_photo-1661915610971-0575b71f8c1d?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Category(
    title: "Beachfront Properties",
    image:
        "https://media.istockphoto.com/id/1989960032/photo/beach-house-terrace-at-summer-sunset.jpg?s=1024x1024&w=is&k=20&c=PNn-4tAYk2sd8THrOAG1faYdsE1wOGxTqNJpsoZuSk8=",
  ),
  Category(
    title: "Urban Apartments",
    image:
        "https://media.istockphoto.com/id/1069330600/photo/cityscape-with-residential-buildings-in-late-autumn.jpg?s=1024x1024&w=is&k=20&c=kYgKb-vhciIUApSQtFtx5_YE2ScEpKJvq2f5YAdQ-7o=",
  ),
  Category(
    title: "Rustic Farmhouses",
    image:
        "https://images.unsplash.com/photo-1444858291040-58f756a3bdd6?q=80&w=1378&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Category(
    title: "Lakefront Retreats",
    image:
        "https://media.istockphoto.com/id/1458236069/photo/aerial-view-of-exclusive-waterfront-property-at-lakeside-in-doncaster.jpg?s=1024x1024&w=is&k=20&c=0spLCrmrwLMZzN0Gl5otxRttTTFZ6zCoenySMT6sDYE=",
  ),
  Category(
    title: "Modern Penthouses",
    image:
        "https://cdn.pixabay.com/photo/2014/06/21/20/16/real-estate-374107_1280.jpg",
  ),
  Category(
    title: "Countryside Cottages",
    image:
        "https://media.istockphoto.com/id/1589467879/photo/landscape-with-house.jpg?s=1024x1024&w=is&k=20&c=My38wonkvfz3Lrz89h5wXvIixnuJZLRWNN-a0zpF95E=",
  ),
  Category(
    title: "Eco-Friendly Homes",
    image:
        "https://media.istockphoto.com/id/181062267/photo/house-with-solar-panels.jpg?s=1024x1024&w=is&k=20&c=pMkMC1nsls_EFeqLpNrZbqCjY1YEed5SOSFfj1CZ9yg=",
  ),
  Category(
    title: "Historic Mansions",
    image:
        "https://media.istockphoto.com/id/669050904/photo/dunleith-historic-inn-natchez-mississippi.jpg?s=1024x1024&w=is&k=20&c=kpHiLEUxY_f6TIfdLYBWHy4__hWJ84As1i9UrHx9DnQ=",
  ),
  Category(
    title: "Ski Chalets",
    image:
        "https://media.istockphoto.com/id/1181579515/photo/courchevel-village-in-alps-mountains-france.jpg?s=1024x1024&w=is&k=20&c=Nokk_hOXngQ8XiB46NX9gFowkbDfvsOXSTbwH-OgX8Y=",
  ),
  Category(
    title: "Desert Villas",
    image:
        "https://media.istockphoto.com/id/121393026/photo/arabian-villa.jpg?s=1024x1024&w=is&k=20&c=g7DDSFL1EOivldG3VQda-5rbkQUaEODwOcVnoAyg--E=",
  ),
  Category(
    title: "Treehouses",
    image:
        "https://cdn.pixabay.com/photo/2016/12/06/14/33/log-cabin-1886620_1280.jpg",
  ),
  Category(
    title: "Floating Homes",
    image:
        "https://cdn.pixabay.com/photo/2020/03/30/08/51/country-4983537_1280.jpg",
  ),
  Category(
    title: "Tiny Houses",
    image:
        "https://cdn.pixabay.com/photo/2020/07/07/09/35/house-5379923_1280.jpg",
  ),
];
