import 'package:get/get.dart';
import 'package:restruant_pos/utils/constant/enums.dart';

class TableDetailsController extends GetxController {
  final floors = <int,String>{0 :'Floor 1',1 : 'Floor 2'}.obs;
  final selectedFloorIndex = 0.obs;
  final selectedFloor = [].obs;

  final initialRow = 3.obs;
  final floor1Tables = List<String>.generate(20, (index) => 'Table ${index + 1}').obs;
  final floor2Tables = List<String>.generate(30, (index) => 'Table ${index + 1}').obs;

  final sliderValue = 3.0.obs;
  final minSliderValue = 3.0.obs;
  final maxSliderValue = 10.0.obs;

  var orderVertical = VerticalOrder.topToBottom.obs;
  var orderHorizontal = HorizontalOrder.leftToRight.obs;

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