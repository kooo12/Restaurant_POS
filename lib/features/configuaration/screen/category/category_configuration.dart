import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/controller/category_controller.dart';
import 'package:restruant_pos/features/configuaration/screen/category/widgets/category_form.dart';
import 'package:restruant_pos/features/configuaration/screen/category/widgets/category_list.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
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
        child: Stack(
          children:[
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // Form Field
              CategoryFormField(controller: controller,),
          
              // Category ListView
              CategoryList( controller: controller,
                  ),
          
              
            ],
          ),
          Positioned(
            bottom: -11,
            left: -10,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info_rounded,
                  color: TpsColors.secondary,
                  size: 40,
                )))
          ]
        ),
      ),
    );
  }
}


