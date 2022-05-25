import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Stream<QuerySnapshot>? foods;
  final count = 0.obs;
  final RxBool isItalian = false.obs;
  final RxBool isPakistani = false.obs;
  final RxBool isIndian = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    foods = FirebaseFirestore.instance.collection('foods').snapshots();
    isLoading.value = false;
  }

  RxBool isLoading = false.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
}
