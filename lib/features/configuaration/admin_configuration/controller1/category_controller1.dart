import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/utils/helpers/helper_functions.dart';

class CategoryController1 extends GetxController {
  final checkboxValue = false.obs;
  final categoryName = TextEditingController();
  final remark = TextEditingController();
  final GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();

  final RxList<String> categories = ['Fried Rice', 'Cold Drink','Snack'].obs;

  void addCategory() {
    if (categoryFormKey.currentState!.validate()) {
      categories.add(categoryName.text);
      TpsHelperFunctions.showSnackBar(
          'Your category have been added successfully.');
      categoryName.clear();
      remark.clear();
    }
    return;
  }

  void updateCategory(int index) {
    if (categoryFormKey.currentState!.validate())
  {categories[index] = categoryName.text;
    Get.back();
    TpsHelperFunctions.showSnackBar(
        'Success!, your category name have been updated');}
    return;
  }

  void deleteCategory(int index) {
    categories.removeAt(index);
    Get.back();
    TpsHelperFunctions.showSnackBar('Successfully deleted.');
  }
}
