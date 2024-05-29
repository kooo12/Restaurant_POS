import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/model/floor_model/floor_model.dart';
import 'package:restruant_pos/features/configuaration/model/table_model/table_model.dart';
import 'package:restruant_pos/features/configuaration/waiter_configurations/screens/order_screen/order_screen.dart';
import 'package:restruant_pos/utils/constant/enums.dart';

class TableController extends GetxController {

  final initialRow = 3.obs;
  final tableConfig = [
    {'floor1' : Floor(id: 1, name: 'Floor 1', tables: List<RTable>.generate(20, (index) => RTable(id: index, name: 'T ${index + 1}')), isDefault: true)},
    {'floor1' : Floor(id: 2, name: 'Floor 2', tables: List<RTable>.generate(30, (index) => RTable(id: index, name: 'T ${index + 1}')), isDefault: false)}
  ].obs;

  final selectedFloorIndex = 0.obs;
  final selectedFloor = Floor(id: 0, name: '', tables: [], isDefault: true).obs;

  final sliderValue = 3.0.obs;
  final minSliderValue = 3.0.obs;
  final maxSliderValue = 10.0.obs;

  var orderVertical = VerticalOrder.topToBottom.obs;
  var orderHorizontal = HorizontalOrder.leftToRight.obs;

  TableController(){
    setSelectedFloor(0);
  }

  void sliderChangedValue (double value){
    sliderValue.value = value;
    initialRow.value = value.toInt();
  }

  void setSelectedFloor (int index){
    selectedFloorIndex.value = index;
    selectedFloor.value = tableConfig[index].values.first;
  }

  void verticalOrder (){
    if(orderVertical.value == VerticalOrder.topToBottom){
      orderVertical.value = VerticalOrder.bottomToTop;
    }
    else {
      orderVertical.value = VerticalOrder.topToBottom;
    }
  }

  void horizontalOrder (){
    if(orderHorizontal.value == HorizontalOrder.leftToRight){
      orderHorizontal.value = HorizontalOrder.rightToLeft;
    }
    else {
      orderHorizontal.value = HorizontalOrder.leftToRight;
    }
  }

  void selectTable(RTable table){
    String floorName = selectedFloor.value.name;
    Get.to(() => OrderScreen(tableName: table.name, floorName: floorName));
  }
}