import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/screen/table_grid_view.dart';
import 'package:restruant_pos/features/configuaration/widgets/table_detail_appbar.dart';
import 'package:restruant_pos/features/configuaration/controller/table_detail_controller.dart';
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