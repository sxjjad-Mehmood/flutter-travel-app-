import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Favouriteprovider extends ChangeNotifier {
  List<String> favouriteid = [];
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> get favorite => favouriteid;
  Favouriteprovider() {
    loadfavourite();
  }
  void togglefavourite(DocumentSnapshot place) async {
    String placeid = place.id;
    if (favouriteid.contains(placeid)) {
      favouriteid.remove(placeid);
      addfavourite(placeid);
    } else {
      favouriteid.add(placeid);
      removefavourite(placeid);
    }
    notifyListeners();
  }

  bool isExist(DocumentSnapshot place) {
    return favouriteid.contains(place.id);
  }

  Future<void> addfavourite(String placeId) async {
    try {
      await firebaseFirestore
          .collection("userFavourites")
          .doc(placeId)
          .set({"isFavourite": true});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> removefavourite(String placeid) async {
    try {
      await firebaseFirestore
          .collection("userFavourites")
          .doc(placeid)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> loadfavourite() async {
    try {
      QuerySnapshot snapshot =
          await firebaseFirestore.collection("userFavourites").get();
      favouriteid = snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  static Favouriteprovider of(BuildContext context, {bool listen = true}) {
    return Provider.of<Favouriteprovider>(context, listen: true);
  }
}
