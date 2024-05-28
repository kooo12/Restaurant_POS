import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/controller/table_controller/table_controller.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/table/widgets/waiter_table_grid.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/helpers/helper_functions.dart';

class TableTransferScreen extends StatelessWidget {
  const TableTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TableController());
    final dark = TpsHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  TpsSizes.defaultSpace, vertical: TpsSizes.sm),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu(
                label: const Text('Select Location'),
                width: 200,
                  inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: dark ? TpsColors.darkerGrey : TpsColors.grey,
                      border: InputBorder.none,
                      outlineBorder: BorderSide.none),
                  initialSelection: controller.selectedFloorIndex.value,
                  onSelected: (index){
                    if(index != null) {
                      controller.setSelectedFloor(index);
                    }}, dropdownMenuEntries: controller.tableConfig.map((floorMap) {
                      int index = controller.tableConfig.indexOf(floorMap);
                      var floor = floorMap.values.first;
                      return DropdownMenuEntry(value: index, label: floor.name);
                    }).toList(),
                  ),
            const SizedBox(height: TpsSizes.spaceBtwItems,),
            Center(
              child: Scrollbar(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(() => waiterTableGridView(controller,200,120)),
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      )
    );
  }
}