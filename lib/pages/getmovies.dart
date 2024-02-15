import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('buscollections');

  Future<List<Map<String, dynamic>>> getData() async {
    QuerySnapshot querySnapshot = await _collection.get();
    DateTime currentDate = DateTime.now();

    List<Map<String, dynamic>> filteredData = querySnapshot.docs
        .where((doc) {
          var moviedet = doc.data() as Map<String, dynamic>;
          String movieexpdate = moviedet['expiryDate'];
          DateTime expdate = DateTime.parse(movieexpdate);

          return currentDate.isBefore(expdate) ||
              currentDate.isAtSameMomentAs(expdate);
        })
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    return filteredData;
  }
}
