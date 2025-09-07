import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

// there we created a savefirebase which we call in main method to uplaod the data
Future<void> savetofirebase() async {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection("myappcollection");
  for (final Place place in placeList) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    ref.doc("das");
    await ref.doc(id).set(place.toMap());
    //   to set key value pair
  }
}

class Place {
  String title;
  bool isActive;
  String image;
  double rating;
  String date;
  double price;
  String address;
  String vendor;
  String vendorProfession;
  List<String> reviews;
  int bed;
  int bathroom;
  int yearOfHosting;
  double latitude;
  double longitude;
  List<String> imageUrls;

  Place({
    required this.title,
    required this.isActive,
    required this.image,
    required this.rating,
    required this.date,
    required this.price,
    required this.address,
    required this.vendor,
    required this.vendorProfession,
    required this.reviews,
    required this.bed,
    required this.bathroom,
    required this.yearOfHosting,
    required this.latitude,
    required this.longitude,
    required this.imageUrls,
  });
  // Convert to Map (useful for Firestore or JSON storage)
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isActive': isActive,
      'image': image,
      'rating': rating,
      'date': date,
      'price': price,
      'address': address,
      'vendor': vendor,
      'vendorProfession': vendorProfession,
      'reviews': reviews,
      'bed': bed,
      'bathroom': bathroom,
      'yearOfHosting': yearOfHosting,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrls': imageUrls,
    };
  }
}

List<Place> placeList = [
  Place(
    title: "Luxury Villa",
    isActive: true,
    image:
        "https://www.shutterstock.com/shutterstock/photos/2195504819/display_1500/stock-photo-modern-homes-and-town-houses-2195504819.jpg",
    rating: 4.8,
    date: "2025-06-16",
    price: 500000,
    address: "123 Ocean Drive, Miami, FL",
    vendor: "John Doe",
    vendorProfession: "Real Estate Agent",
    reviews: ["Amazing place!", "Worth every penny!", "Will visit again!"],
    bed: 5,
    bathroom: 4,
    yearOfHosting: 10,
    latitude: 25.7617,
    longitude: -80.1918,
    imageUrls: [
      "https://www.shutterstock.com/shutterstock/photos/2219529469/display_1500/stock-photo-generic-residential-neighborhood-for-housing-concepts-digitally-generated-d-rendering-and-not-2219529469.jpg",
      "https://www.shutterstock.com/shutterstock/photos/2514372355/display_1500/stock-photo-minimalist-empty-living-room-with-light-wooden-flooring-potted-plant-arched-wood-paneling-and-2514372355.jpg"
    ],
  ),
  Place(
    title: "Cozy Apartment",
    isActive: true,
    image: "https://images.pexels.com/photos/2111757/pexels-photo-2111757.jpeg",
    rating: 4.5,
    date: "2024-12-05",
    price: 120000,
    address: "456 Downtown St, New York, NY",
    vendor: "Jane Smith",
    vendorProfession: "Property Manager",
    reviews: ["Great location!", "Comfortable stay!", "Friendly host!"],
    bed: 2,
    bathroom: 1,
    yearOfHosting: 5,
    latitude: 40.7128,
    longitude: -74.0060,
    imageUrls: [
      "https://images.pexels.com/photos/7045712/pexels-photo-7045712.jpeg",
      "https://images.pexels.com/photos/7045705/pexels-photo-7045705.jpeg"
    ],
  ),
  Place(
    title: "Mountain Cabin",
    isActive: true,
    image:
        "https://images.pexels.com/photos/7746560/pexels-photo-7746560.jpeg",
    rating: 4.7,
    date: "2023-10-20",
    price: 90000,
    address: "789 Summit Way, Aspen, CO",
    vendor: "Emily Johnson",
    vendorProfession: "Travel Host",
    reviews: ["Peaceful retreat!", "Cozy and scenic!", "Perfect getaway!"],
    bed: 3,
    bathroom: 2,
    yearOfHosting: 7,
    latitude: 39.1911,
    longitude: -106.8175,
    imageUrls: [
      "https://images.pexels.com/photos/7746106/pexels-photo-7746106.jpeg",
      "https://images.pexels.com/photos/7746033/pexels-photo-7746033.jpeg"
    ],
  ),
// Previous entries...
  Place(
    title: "Rustic Farmhouse",
    isActive: true,
    image:
        "https://images.pexels.com/photos/247532/pexels-photo-247532.jpeg",
    rating: 4.3,
    date: "2023-08-15",
    price: 85000,
    address: "789 Countryside Road, Texas, TX",
    vendor: "Robert Williams",
    vendorProfession: "Farmstay Host",
    reviews: [
      "Authentic farm experience!",
      "Peaceful and relaxing!",
      "Great for families!"
    ],
    bed: 3,
    bathroom: 2,
    yearOfHosting: 6,
    latitude: 31.9686,
    longitude: -99.9018,
    imageUrls: [
      "https://images.pexels.com/photos/5953664/pexels-photo-5953664.jpeg",
      "https://images.pexels.com/photos/10287967/pexels-photo-10287967.jpeg"
    ],
  ),
  Place(
    title: "Urban Loft",
    isActive: true,
    image:
        "https://images.pexels.com/photos/13613479/pexels-photo-13613479.jpeg",
    rating: 4.7,
    date: "2024-05-10",
    price: 220000,
    address: "456 City Center, Chicago, IL",
    vendor: "Lisa Brown",
    vendorProfession: "Luxury Rentals Specialist",
    reviews: [
      "Stylish and modern!",
      "Great city views!",
      "Perfect for business travelers!"
    ],
    bed: 2,
    bathroom: 1,
    yearOfHosting: 4,
    latitude: 41.8781,
    longitude: -87.6298,
    imageUrls: [
      "https://images.pexels.com/photos/2724749/pexels-photo-2724749.jpeg",
"https://images.pexels.com/photos/1457847/pexels-photo-1457847.jpeg"
    ],
  ),
  Place(
    title: "Lakefront Retreat",
    isActive: true,
    image:
        "https://images.pexels.com/photos/28286660/pexels-photo-28286660.jpeg",
    rating: 4.9,
    date: "2025-02-20",
    price: 300000,
    address: "321 Lakeside Drive, Seattle, WA",
    vendor: "Mark Thompson",
    vendorProfession: "Vacation Rental Expert",
    reviews: [
      "Serene and beautiful!",
      "Perfect for relaxation!",
      "Amazing lake views!"
    ],
    bed: 4,
    bathroom: 3,
    yearOfHosting: 9,
    latitude: 47.6062,
    longitude: -122.3321,
    imageUrls: [
      "https://images.pexels.com/photos/32290708/pexels-photo-32290708.jpeg",
      "https://images.pexels.com/photos/9872065/pexels-photo-9872065.jpeg"
    ],
  ),
];
