import 'package:flutter/material.dart';
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
    required this.title, required this.orders, required this.isComplete, required this.tableTextStyle, required this.tableColor,
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
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: TpsSizes.spaceBtwItems,
        ),
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            itemCount: controller.pendingOrders.length,
            itemBuilder: (context, index) {
              var order = orders[index];
              var tableName = order.table.name;
              var menuItems = order.menuItems;
              if(menuItems.isEmpty){
                return const SizedBox.shrink();
              }
              return Row(
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
                        children: menuItems.map((menu) {
                
                          return 
                              
                              GestureDetector(
                                onTap: (){
                                  if(isComplete){
                                    controller.setMenuToIncomplete(order.id, menu.id);
                                  }
                                  else{
                                    controller.setMenuToComplete(order.id, menu.id);
                                  }
                                },
                                child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: TpsSizes.defaultSpace),
                                child: Column(
                                  children: [
                                    Text(
                                      menu.name,
                                      style: menu.isUrgent
                                          ? Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(color: TpsColors.error)
                                          : Theme.of(context).textTheme.titleLarge,
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
                              );
                          
                        }).toList(),
                      ),
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 30,
            ),
          ),
        ),
      ],
    );
  }
}
