import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/controller/category_controller.dart';
import 'package:restruant_pos/features/configuaration/widgets/category_form.dart';
import 'package:restruant_pos/features/configuaration/widgets/category_list.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';

class CategoriesConfiguration extends StatelessWidget {
  const CategoriesConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TpsSizes.md, vertical: TpsSizes.defaultSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Form Field
            CategoryFormField(controller: controller,),

            // Category ListView
            CategoryList( controller: controller,
                )
          ],
        ),
      ),
    );
  }
}


