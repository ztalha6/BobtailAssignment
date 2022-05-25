import 'package:bobtail_assignment/app/data/model/filter_model.dart';
import 'package:bobtail_assignment/app/data/model/food_model.dart';
import 'package:bobtail_assignment/app/data/provider/food_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Food> foods = RxList<Food>();
  RxList<Food> filteredFoods = RxList<Food>();
  RxList<FilterModel> filters = RxList<FilterModel>();

  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    foods.value = [];
    filteredFoods.value = [];
    filters.value = [];
    isLoading.value = true;
    filters.value = FilterModel().filters;
    foods.value = await FoodProvider().getFoods();
    isLoading.value = false;
  }

  void setFilter(int i, bool value) {
    filters[i].isSelected = value;
    if (filters[i].isSelected!) {
      filteredFoods
          .addAll(foods.where((food) => food.cuisine == filters[i].name));
    } else {
      filteredFoods.removeWhere(((food) => food.cuisine == filters[i].name));
    }
  }
}
