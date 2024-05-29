import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.tableName, required this.floorName});

  final String tableName;
  final String floorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$tableName ($floorName)',style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(width: TpsSizes.spaceBtwSections,),
          Text('MMK 9800',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: TpsColors.tableColor),)
        ],
      ),),
      body: const Row(
        children: [
          Column(
            children: [
              // Expanded(
              //   child: ListView.builder(
                  
              //     itemBuilder: (context,index){
                    
              //     }),
              // )
            ],
          )
        ],
      )
    );
  }
}