import 'package:flutter/material.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/helpers/helper_functions.dart';

class CategoryConfigation extends StatelessWidget {
  const CategoryConfigation({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = TpsHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
          indicatorColor: TpsColors.primary,
          unselectedLabelColor: TpsColors.darkGrey,
          labelColor: dark ? TpsColors.white : TpsColors.primary,
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
      ),
    );
  }
}

