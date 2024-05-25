import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/table_controller/table_controller.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/table/widgets/waiter_table_grid.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';

class TableTransferScreen extends StatelessWidget {
  const TableTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TableController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  TpsSizes.defaultSpace, vertical: TpsSizes.sm),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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