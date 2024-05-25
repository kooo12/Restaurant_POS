import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/common/widgets/custom_shapes/containers/table_container.dart';
import 'package:restruant_pos/features/configuaration/admin_configuration/screen/admin_home_screen.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/waiter_home_screen.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Get.to(() => const AdminHomeScreen()),
              child: const TableContainer(tableName: 'Admin', tableColor: TpsColors.grey, borderRadius: 20, width: 150, height: 150,)),
            const SizedBox(width: TpsSizes.spaceBtwItems,),
            GestureDetector(
              onTap: () => Get.to(() => const WaiterHomeScreen()),
              child: const TableContainer(tableName: 'Waiter', tableColor: TpsColors.grey, borderRadius: 20, width: 150, height: 150,)),
          ],
        ),
      ),
    );
  }
}