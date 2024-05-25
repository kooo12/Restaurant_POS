import 'package:flutter/material.dart';

class TableContainer extends StatelessWidget {
  const TableContainer({
    super.key, required this.tableName, required this.tableColor, required this.borderRadius,
  });
  
  final String tableName;
  final Color tableColor;
  final double borderRadius; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration:  BoxDecoration(
        color: tableColor,
        borderRadius:  BorderRadius.all(Radius.circular(borderRadius))
      ),
      child: Center(child: Text(tableName,style: Theme.of(context).textTheme.titleMedium,)),
    );
  }
}