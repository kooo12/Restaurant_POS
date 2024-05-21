import 'package:flutter/material.dart';
import 'package:restruant_pos/features/configuaration/screen/category_configuration.dart';
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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new)), // Leading is temporary
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
          ],),),
          body: const TabBarView(children: <Widget>[
            Center(child: Text('UserScreen'),),
            CategoriesConfiguration(),
            Center(child: Text('Menu Screen'),),
            Center(child: Text('Note Screen'),),
          ]),
      ),
    );
  }
}

