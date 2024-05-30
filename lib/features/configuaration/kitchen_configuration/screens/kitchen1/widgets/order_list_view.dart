import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/common/widgets/custom_shapes/containers/table_container.dart';
import 'package:restruant_pos/features/configuaration/kitchen_configuration/controllers/kitchen_order_controller.dart';
import 'package:restruant_pos/features/configuaration/model/order/order_model.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({
    super.key,
    required this.controller,
    required this.title,
    required this.orders,
    required this.isComplete,
    required this.tableTextStyle,
    required this.tableColor,
  });

  final KitchenOrderController controller;
  final String title;
  final RxList<OrderModel> orders;
  final bool isComplete;
  final TextStyle tableTextStyle;
  final Color tableColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              children: [
                isComplete
                    ? SizedBox(
                        width: 100,
                        child: Obx(
                          () => ElevatedButton(
                              onPressed: controller.completedOrders.isEmpty
                                  ? null
                                  : () {},
                              child: const Text('Ready')),
                        ),
                      )
                    : const SizedBox(),
                  const SizedBox(width: TpsSizes.md,),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        if (isComplete) {
                          controller.moveSelectedMenusToIncomplete();
                        } else {
                          controller.moveSelectedMenusToComplete();
                        }
                      },
                      child: Text(isComplete ? 'Restore' : 'Complete')),
                ),
              ],
            ),
          ],
        ),
        // const SizedBox(
        //   height: TpsSizes.spaceBtwItems,
        // ),
        Expanded(
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(vertical: TpsSizes.md),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  var order = orders[index];
                  var tableName = order.table.name;
                  var groupedMenuItems = controller.groupMenuItems(order.menuItems);
                  // var hasSelected = menuItems.any((menu) => controller.selectedMenuItems.contains(menu.id));
                  // if(menuItems.isEmpty){
                  //   return const Text();
                  // }
                  return Obx(
                    () => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TableContainer(
                          tableName: Text(
                            tableName,
                            style: tableTextStyle,
                          ),
                          tableColor: tableColor,
                          borderRadius: 10,
                          width: 100,
                          height: 60,
                        ),
                        const SizedBox(
                          width: TpsSizes.spaceBtwSections,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: groupedMenuItems.map((entry) {
                                var menu = entry.key;
                                var count = entry.value;
                                bool isSelected = controller.selectedMenuItems
                                    .contains(menu.id);
                                return GestureDetector(
                                  onTap: () {
                                    controller.toggleSelection(menu.id);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: TpsSizes.xs),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: isSelected
                                              ? TpsColors.primary
                                                  .withOpacity(0.3)
                                              : null,
                                          border: isSelected
                                              ? Border.all(
                                                  style: BorderStyle.none,
                                                  color: TpsColors.primary,
                                                  width: 2.0)
                                              : null),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: TpsSizes.sm,
                                            vertical: TpsSizes.xs),
                                        child: Column(
                                          children: [
                                            Text(
                                              '${menu.name} x$count',
                                              style: menu.isUrgent
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .titleLarge!
                                                      .copyWith(
                                                          color:
                                                              TpsColors.error)
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                            ),
                                            menu.note != null
                                                ? Text('(${menu.note})',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                          color: TpsColors.blue,
                                                        ))
                                                : const SizedBox()
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        // IconButton(
                        //     onPressed: () {
                        // if (isComplete) {
                        //   controller.moveSelectedMenusToIncomplete();
                        // } else {
                        //   controller.moveSelectedMenusToComplete();
                        // }
                        //     },
                        //     icon: const Icon(
                        //       Icons.check,
                        //       color: Color.fromARGB(255, 30, 64, 8),
                        //     ))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
