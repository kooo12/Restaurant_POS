import 'package:flutter/material.dart';
import 'package:restruant_pos/features/configuaration/screen/category_configuration.dart';
import 'package:restruant_pos/features/configuaration/screen/table_configuration.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = TpsHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      initialIndex: 1,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
          indicatorColor: dark ? TpsColors.blue : TpsColors.primary,
          unselectedLabelColor:TpsColors.darkGrey,
          labelColor: dark ? TpsColors.white : TpsColors.primary,
          labelStyle: const TextStyle(fontSize: TpsSizes.lg),
          tabs: const <Widget>[
            Tab(
              text: 'Users',
            ),
            Tab(
              text: 'Categories',
            ),
            Tab(
              text: 'Menu',
            ),
            Tab(
              text: 'Note',
            ),
            Tab(
              text: 'Locations',
            ),
            Tab(
              text: 'Tables',
            ),
          ],),),
          body: const TabBarView(children: <Widget>[
            Center(child: Text('UserScreen'),),
            CategoriesConfiguration(),
            Center(child: Text('Menu Screen'),),
            Center(child: Text('Note Screen'),),
            Center(child: Text('Location Screen'),),
            TableConfiguration(),
          ]),
      ),
    );
  }
}

