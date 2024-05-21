import 'package:flutter/material.dart';
import 'package:restruant_pos/features/configuaration/controller/category_controller.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/constant/texts_strings.dart';
import 'package:restruant_pos/utils/helpers/helper_functions.dart';

void updateCategory(String initialValue,CategoryController controller,int index) {
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
        ],
        
      ),
      // Action button
     () => controller.updateCategory(index)
      );
}