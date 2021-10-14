import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('category');

class Database {
  static String userUid;

  static Future<void> addItem({
     String title,
     String productname,
     String productprice,
     String subcategory,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('subcategory').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "productname" : productname,
      "productprice": productprice,
      "subcategory" : subcategory,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }
}
