import 'package:flutter/material.dart';
import 'package:restruant_pos/features/configuaration/admin_configuration/controller1/category_controller1.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/constant/texts_strings.dart';
import 'package:restruant_pos/utils/helpers/helper_functions.dart';

void updateCategory(String initialValue,CategoryController1 controller,int index) {
  return TpsHelperFunctions.showUpdateDialog(
      // title
      'Edit Category', 
      //  body
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            child: TextFormField(
              controller: controller.categoryName,
              decoration:
                  const InputDecoration(label: Text(TpsTexts.categoryLabel)),
            ),
          ),
          const SizedBox(
            height: TpsSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(label: Text(TpsTexts.remark)),
          ),
          const SizedBox(height: TpsSizes.spaceBtwItems,),
        ],
        
      ),
      // Action button
     () => controller.updateCategory(index)
      );
}