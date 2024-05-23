import 'package:flutter/material.dart';
import 'package:restruant_pos/utils/constant/colors.dart';

class TableContainer extends StatelessWidget {
  const TableContainer({
    super.key, required this.tableName,
  });
  
  final String tableName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        color: TpsColors.grey
      ),
      child: Center(child: Text(tableName,style: Theme.of(context).textTheme.titleMedium,)),
    );
  }
}