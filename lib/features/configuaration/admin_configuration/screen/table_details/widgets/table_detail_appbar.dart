import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/controller/table_controller/table_controller.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/device/device_utility.dart';
import 'package:restruant_pos/utils/helpers/helper_functions.dart';

class TableDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TableDetailsAppBar({super.key, required this.controller});

  final TableController controller;

  @override
  Widget build(BuildContext context) {
    final dark = TpsHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TpsSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
              const SizedBox(
                width: TpsSizes.spaceBtwItems,
              ),
              Obx(
                () => Text(
                  'Table - ${controller.selectedFloor.value.tables.length}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                width: TpsSizes.spaceBtwItems,
              ),
              IconButton(
                  onPressed: () => controller.verticalOrder(), icon: const Icon(Icons.swap_vert_circle)),
              IconButton(
                  onPressed: () => controller.horizontalOrder(), icon: const Icon(Icons.swap_horizontal_circle)),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  'Row Count',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: TpsSizes.spaceBtwItems,),
                Obx(() => Row(
                  children: [
                    Text(controller.sliderValue.toStringAsFixed(0),style: Theme.of(context).textTheme.headlineMedium,),
                    Slider(
                      thumbColor: TpsColors.primary,
                      activeColor: TpsColors.primary,
                      inactiveColor: TpsColors.darkGrey,
                        value: controller.sliderValue.value,
                        min: controller.minSliderValue.value,
                        max: controller.maxSliderValue.value,
                        divisions: 7,
                        label: controller.sliderValue.value.round().toString(),
                        onChanged: (value) {
                          controller.sliderChangedValue(value);
                        }),
                    Text(controller.maxSliderValue.toStringAsFixed(0),style: Theme.of(context).textTheme.headlineMedium,),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TpsDeviceUtils.getAppBarHeight());
}
