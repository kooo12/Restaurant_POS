import 'package:flutter/material.dart';
import 'package:restruant_pos/common/widgets/custom_shapes/containers/table_container.dart';
import 'package:restruant_pos/features/configuaration/controller/table_detail_controller.dart';
import 'package:restruant_pos/utils/constant/colors.dart';
import 'package:restruant_pos/utils/constant/enums.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';

Widget tableGridView (TableDetailsController controller){

    int rowCount = controller.initialRow.value;
    int columnCount = (controller.selectedFloor.length / rowCount).ceil();

    List<Row> row = [];

    for(int i = 0; i < rowCount; i++){
      List<Widget> rowChildren = [];
    
    for(int j = 0; j < columnCount; j++){
      int index = j * rowCount + i ;
      if(index < controller.selectedFloor.length){
        rowChildren.add(Padding(
          padding: const EdgeInsets.all(TpsSizes.sm),
          child: TableContainer(tableName: controller.selectedFloor[index], tableColor: TpsColors.grey, borderRadius: 0,),
        ));
      }
      else{
        rowChildren.add(const Padding(
          padding: EdgeInsets.all(TpsSizes.sm),
          child: SizedBox(width: 150,height: 150,),
        ));
      }
    }

    if (controller.orderHorizontal.value == HorizontalOrder.rightToLeft){
      rowChildren = rowChildren.reversed.toList();
    }
    row.add(Row(children: rowChildren,));
    }

    if(controller.orderVertical.value == VerticalOrder.bottomToTop){
      row = row.reversed.toList();
    }
    return Column(children: row,);
  }
