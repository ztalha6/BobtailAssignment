import 'package:bobtail_assignment/app/modules/home/controllers/home_controller.dart';
import 'package:bobtail_assignment/app/modules/home/widgets/food_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetX<HomeController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Foods'),
          actions: [
            IconButton(
              onPressed: () => controller.onInit(),
              icon: Icon(Icons.refresh),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Visibility(
                visible: !controller.isLoading.value,
                child: Row(
                  children: [
                    for (int i = 0; i < controller.filters.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterChip(
                          selected: controller.filters[i].isSelected!,
                          label: Text(controller.filters[i].name!),
                          onSelected: (bool value) {
                            controller.setFilter(i, value);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (controller.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            Expanded(
              flex: 9,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: controller.filteredFoods.isEmpty
                    ? controller.foods.length
                    : controller.filteredFoods.length,
                itemBuilder: (BuildContext context, int index) {
                  return FoodWidget(
                    food: controller.filteredFoods.isEmpty
                        ? controller.foods[index]
                        : controller.filteredFoods[index],
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
