import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/controller/category_controller.dart';
import 'package:restruant_pos/features/configuaration/widgets/update_dialog.dart';
import 'package:restruant_pos/utils/helpers/helper_functions.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.controller,
  });

  final CategoryController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TpsHelperFunctions.screenWidth() * 0.6,
      child: Obx(
        () => ListView.builder(
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.categoryName.text = controller.categories[index];
                  updateCategory(controller.categories[index], controller,index);
                },
                child: Card(
                    child: ListTile(
                  title: Text(controller.categories[index]),
                  trailing: IconButton(
                      onPressed: () => TpsHelperFunctions.showAlert(
                          'Delete?',
                          'Are you sure, you want to delete?',
                          () => controller.deleteCategory(index)),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                )),
              );
            }),
      ),
    );
  }
}
