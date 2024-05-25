import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/connect.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/menu.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/settings.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/table/table_transfer.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/constant/texts_strings.dart';

class WaiterHomeScreen extends StatelessWidget {
  const WaiterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DrawerController());
    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          Text(TpsTexts.appBarShopName,style: Theme.of(context).textTheme.headlineSmall,),
          Text(TpsTexts.userName,style: Theme.of(context).textTheme.headlineMedium,),
        ],
      ),),
      drawer: SafeArea(

        child: Drawer(
          // semanticLabel: 'Tea Shop',
          child: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: TpsSizes.md, vertical: TpsSizes.md),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tea Shop',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const DrawerButton()
                ],
              ),
              const SizedBox(
                height: TpsSizes.spaceBtwSections,
              ),
              ListTile(
                title: Text(
                  'Myat Min Ko',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                // onTap: () => controller.selectScreen(),
              ),
              const SizedBox(
                height: TpsSizes.spaceBtwSections,
              ),
              ListTile(
                title: Text(
                  'Table Transfer',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  controller.selectScreen(0);
                  Get.back();
                },
              ),
              ListTile(
                title: Text(
                  'Menu',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  controller.selectScreen(1);
                  Get.back();
                },
              ),
              ListTile(
                title: Text(
                  'Connect',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  controller.selectScreen(2);
                  Get.back();
                  
                },
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  controller.selectScreen(3);
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class DrawerController extends GetxController {
  final selectedIndex = 0.obs;
  final screens = const [
    TableTransferScreen(),
    MenuScreen(),
    ConnectScreen(),
    SettingsScreen()
  ].obs;

  void selectScreen(int index) {
    selectedIndex.value = index;
  }
}
