import 'package:bobtail_assignment/app/modules/home/controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetX<HomeController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text('Foods')),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    FilterChip(
                      selected: controller.isItalian.value,
                      label: Text("Italian"),
                      onSelected: (bool value) {
                        controller.isItalian.value = value;
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterChip(
                      selected: controller.isPakistani.value,
                      label: Text("Pakistani"),
                      onSelected: (bool value) {
                        controller.isPakistani.value = value;
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilterChip(
                      selected: controller.isIndian.value,
                      label: Text("Indian"),
                      onSelected: (bool value) {
                        controller.isIndian.value = value;
                      },
                    ),
                  ],
                )),
            Expanded(
              flex: 9,
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.foods,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error occured while dfetching data!');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading');
                  }
                  final data = snapshot.requireData;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: data.size,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: [
                            Image.network(data.docs[index]['imageUrl']),
                            SizedBox(height: 10),
                            Text(data.docs[index]['name']),
                            Text(data.docs[index]['cuisine']),
                          ],
                        ),
                      );
                    },
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
