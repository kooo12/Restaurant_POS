import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/kitchen_configuration/controllers/kitchen_order_controller.dart';
import 'package:restruant_pos/features/configuaration/kitchen_configuration/screens/kitchen1/widgets/order_list_view.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/constant/texts_strings.dart';

class KitchenOrderScreen extends StatelessWidget {
  const KitchenOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KitchenOrderController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TpsSizes.defaultSpace),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: OrderListView(
                controller: controller,
                title: TpsTexts.pending,
                tableTextStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: TpsColors.white),
                orders: controller.pendingOrders,
                isComplete: false,
                tableColor: TpsColors.error,
              ),
            ),
            const VerticalDivider(
              thickness: 3,
              width: 50,
              indent: 10,
              endIndent: 20,
            ),
            Flexible(
                child: OrderListView(
              controller: controller,
              title: TpsTexts.complete,
              tableTextStyle: Theme.of(context).textTheme.headlineMedium!,
              tableColor: TpsColors.tableColor,
              orders: controller.completedOrders,
              isComplete: true,
            ))
          ],
        ),
      ),
    );
  }
}
