import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/controller/category_controller.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/constant/texts_strings.dart';
import 'package:restruant_pos/utils/validators/validation.dart';

class CategoryFormField extends StatelessWidget {
   const CategoryFormField({
    super.key, required this.controller,
  });
final CategoryController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Form(
        key: controller.categoryFormKey,
        child: Column(
        children: [
          TextFormField(
            controller: controller.categoryName,
            validator: (value){return TpsValidator.validateEmptyText('Category Name', value);},
            decoration: const InputDecoration(
              label: Text(TpsTexts.categoryLabel)
            ),
          ),
          const SizedBox(height: TpsSizes.spaceBtwInputFields,),
          TextFormField(
            controller: controller.remark,
            decoration: const InputDecoration(
              label: Text(TpsTexts.remark)
            ),
          ),
          const SizedBox(height: TpsSizes.spaceBtwInputFields,),
          Row(
            children: [
              Obx(() => Checkbox(value: controller.checkboxValue.value, onChanged: (value){controller.checkboxValue.value = value!;})),
              Text('Active',style: Theme.of(context).textTheme.bodyLarge,),
            ],
          ),
          const SizedBox(height: TpsSizes.spaceBtwItems,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => controller.addCategory()
            , child: Text('Add Category',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TpsColors.white),)))
        ],
      )),
    );
  }
}