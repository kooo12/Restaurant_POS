import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/global_model/table_model/table_model.dart';
import 'package:restruant_pos/utils/constant/enums.dart';

class TableController extends GetxController {
  final floors = <int,String>{0 :'Floor 1',1 : 'Floor 2'}.obs;
  final selectedFloorIndex = 0.obs;
  final selectedFloor = [].obs;

  final initialRow = 3.obs;
  final floor1Tables = List<RTable>.generate(20, (index) => RTable(id: index, name: 'Table ${index + 1}', isDefault: true)).obs;
  final floor2Tables = List<RTable>.generate(30, (index) => RTable(id: index, name: 'Table ${index + 1}', isDefault: false)).obs;

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
    if(index == 0){
      selectedFloor.value = floor1Tables;
    }
    else if (index == 1) {
      selectedFloor.value = floor2Tables;
    }
    else {
      [];
    }
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
}