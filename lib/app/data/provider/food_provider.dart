import 'package:bobtail_assignment/app/data/model/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodProvider {
  Future<List<Food>> getFoods() async {
    QuerySnapshot? foods =
        await FirebaseFirestore.instance.collection('foods').get();
    return foods.docs
        .map((doc) => Food(
              name: doc['name'],
              imageUrl: doc['imageUrl'],
              cuisine: doc['cuisine'],
            ))
        .toList();
  }
}
