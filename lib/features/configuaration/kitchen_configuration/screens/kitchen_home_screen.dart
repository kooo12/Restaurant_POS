import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/kitchen_configuration/screens/kitchen1/kitchen_order_screen.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/connect.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/settings.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/constant/texts_strings.dart';

class KitchenHomeScreen extends StatelessWidget {
  const KitchenHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DrawerController());
    return Scaffold(
      appBar: AppBar(title: Text(TpsTexts.kitchen1,style: Theme.of(context).textTheme.headlineMedium,),centerTitle: true,),
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
                    TpsTexts.shopName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const DrawerButton()
                ],
              ),
              const SizedBox(
                height: TpsSizes.spaceBtwSections,
              ),
              Text(
                  TpsTexts.kitchen1,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                
              const SizedBox(
                height: TpsSizes.spaceBtwSections,
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  controller.selectScreen(0);
                  Get.back();
                },
              ),
             
              ListTile(
                title: Text(
                  'Connect',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  controller.selectScreen(1);
                  Get.back();
                  
                },
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  controller.selectScreen(2);
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
   KitchenOrderScreen(),
   ConnectScreen(),
   SettingsScreen(),
  ].obs;

  void selectScreen(int index) {
    selectedIndex.value = index;
  }
}