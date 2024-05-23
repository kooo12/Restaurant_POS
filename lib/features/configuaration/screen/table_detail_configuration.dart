import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/common/widgets/custom_shapes/containers/table_container.dart';
import 'package:restruant_pos/features/configuaration/widgets/table_detail_appbar.dart';
import 'package:restruant_pos/features/configuaration/controller/table_detail_controller.dart';
import 'package:restruant_pos/utils/constant/enums.dart';
import 'package:restruant_pos/utils/constant/sizes.dart';
import 'package:restruant_pos/utils/constant/texts_strings.dart';

class TableDetailConfiguration extends StatelessWidget {
  const TableDetailConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TableDetailsController());
   
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TpsTexts.tableDetailTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        bottom: TableDetailsAppBar(controller: controller),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  TpsSizes.defaultSpace, vertical: TpsSizes.sm),
        child: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
              child: Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() => tableGridView(controller)),
                ),
              ),
            ),
          ),
        ),
      )
     
    );
  } 
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
          child: TableContainer(tableName: controller.selectedFloor[index]),
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
}



//  Center(
//         child: Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: TpsSizes.xl, vertical: TpsSizes.defaultSpace),
//             child: Obx(
//               () => GridView.builder(
//                 physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: controller.initialRow.value,
//                   mainAxisSpacing: 20.0,
//                   crossAxisSpacing: 20.0,
//                   childAspectRatio: 1,
//                 ),
//                 shrinkWrap: true,
//                 itemCount: controller.totalTables.length,
//                 itemBuilder: (BuildContext context, int index) {
            
//                   return TableContainer(tableName: 'T$index');
//                 },
//                 scrollDirection: Axis.horizontal,
//               ),
//             )),
//       ),