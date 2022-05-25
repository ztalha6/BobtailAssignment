import 'package:bobtail_assignment/app/data/model/food_model.dart';
import 'package:flutter/material.dart';

class FoodWidget extends StatelessWidget {
  final Food? food;
  const FoodWidget({Key? key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(food!.imageUrl!),
          SizedBox(height: 10),
          Text(food!.name!),
          Text(food!.cuisine!),
        ],
      ),
    );
  }
}
