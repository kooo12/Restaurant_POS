import 'package:flutter/material.dart';

class TableContainer extends StatelessWidget {
  const TableContainer({
    super.key, required this.tableName, required this.tableColor, required this.borderRadius, required this.width, required this.height,
  });
  
  final String tableName;
  final Color tableColor;
  final double borderRadius;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:  BoxDecoration(
        color: tableColor,
        borderRadius:  BorderRadius.all(Radius.circular(borderRadius))
      ),
      child: Center(child: Text(tableName,style: Theme.of(context).textTheme.titleMedium,)),
    );
  }
}