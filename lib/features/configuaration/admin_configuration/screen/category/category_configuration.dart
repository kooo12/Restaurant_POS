import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/admin_configuration/controller1/category_controller1.dart';
import 'package:restruant_pos/features/configuaration/admin_configuration/screen/category/widgets/category_form.dart';
import 'package:restruant_pos/features/configuaration/admin_configuration/screen/category/widgets/category_list.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';

class CategoriesConfiguration extends StatelessWidget {
  const CategoriesConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController1());
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
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
      ),
    );
  }
}


