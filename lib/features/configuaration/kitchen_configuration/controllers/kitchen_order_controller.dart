import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/model/menu_model/menu_model.dart';
import 'package:restruant_pos/features/configuaration/model/order/order_model.dart';
import 'package:restruant_pos/features/configuaration/model/table_model/table_model.dart';

class KitchenOrderController extends GetxController{
  final pendingOrders = [
    OrderModel(id: 1, table: RTable(id: 2, name: 'T2'), menuItems: [MenuModel(id: 2, name: 'ငါးထမင်းနယ်', price: 5000, note: 'ငါးများများ ထည့်ပေးပါ',isUrgent: true),MenuModel(id: 3, name: 'American Fried Riced', price: 8000, note: null),MenuModel(id: 4, name: 'MoteHinNgar', price: 3000),MenuModel(id: 5, name: 'KyarZanHinn', price: 2500),MenuModel(id: 6, name: 'ArrPuSharPu', price: 1500)], isComplete: false),
    OrderModel(id: 2, table: RTable(id: 8, name: 'T8'), menuItems: [MenuModel(id: 7, name: 'Tea', price: 2500, note: 'မလိုင်ထည့်ပေးပါ'),MenuModel(id: 8, name: 'Thai Style Fried Riced', price: 8000, note: 'အစပ်လျှော့')], isComplete: false),
    OrderModel(id: 3, table: RTable(id: 5, name: 'T5'), menuItems: [MenuModel(id: 9, name: 'ငါးထမင်းနယ်', price: 5000, note: 'ငါးများများ ထည့်ပေးပါ',isUrgent: true),MenuModel(id: 10, name: 'American Fried Riced', price: 8000, note: null),MenuModel(id: 11, name: 'MoteHinNgar', price: 3000),MenuModel(id: 12, name: 'KyarZanHinn', price: 2500),MenuModel(id: 99, name: 'ArrPuSharPu', price: 1500)], isComplete: false),
    OrderModel(id: 4, table: RTable(id: 6, name: 'T6'), menuItems: [MenuModel(id: 13, name: 'Tea', price: 2500, note: 'မလိုင်ထည့်ပေးပါ'),MenuModel(id: 14, name: 'Thai Style Fried Riced', price: 8000, note: 'အစပ်လျှော့')], isComplete: false),
    OrderModel(id: 5, table: RTable(id: 16, name: 'T16'), menuItems: [MenuModel(id: 15, name: 'ငါးထမင်းနယ်', price: 5000, note: 'ငါးများများ ထည့်ပေးပါ',isUrgent: true),MenuModel(id: 16, name: 'American Fried Riced', price: 8000, note: null),MenuModel(id: 17, name: 'MoteHinNgar', price: 3000),MenuModel(id: 18, name: 'KyarZanHinn', price: 2500),MenuModel(id: 19, name: 'ArrPuSharPu', price: 1500)], isComplete: false),
    OrderModel(id: 6, table: RTable(id: 20, name: 'T20'), menuItems: [MenuModel(id: 20, name: 'Tea', price: 2500, note: 'မလိုင်ထည့်ပေးပါ'),MenuModel(id: 21, name: 'Thai Style Fried Riced', price: 8000, note: 'အစပ်လျှော့')], isComplete: false),
    OrderModel(id: 7, table: RTable(id: 30, name: 'T30'), menuItems: [MenuModel(id: 30, name: 'Tea', price: 2500, note: 'မလိုင်ထည့်ပေးပါ'),MenuModel(id: 31, name: 'Thai Style Fried Riced', price: 8000, note: 'အစပ်လျှော့')], isComplete: false),
    OrderModel(id: 8, table: RTable(id: 33, name: 'T33'), menuItems: [MenuModel(id: 32, name: 'Tea', price: 2500, note: 'မလိုင်ထည့်ပေးပါ'),MenuModel(id: 33, name: 'Thai Style Fried Riced', price: 8000, note: 'အစပ်လျှော့')], isComplete: false)
  ].obs;

  final completedOrders = <OrderModel>[].obs;

  final selectedMenuItems = <int>{}.obs;

  void toggleSelection(int menuItemId){
    if(selectedMenuItems.contains(menuItemId)){
      selectedMenuItems.remove(menuItemId);
    }
    else{
      selectedMenuItems.add(menuItemId);
    }
  }

  List<MapEntry<MenuModel, int>> groupMenuItems(List<MenuModel> menuItems) {
    final Map<String, int> groupedItems = {};
    final Map<String, MenuModel> menuModelMap = {};

    for (var menu in menuItems) {
      final key = '${menu.id}_${menu.note ?? ''}';
      if (groupedItems.containsKey(key)) {
        groupedItems[key] = groupedItems[key]! + 1;
      } else {
        groupedItems[key] = 1;
        menuModelMap[key] = menu;
      }
    }

    return groupedItems.entries.map((e) => MapEntry(menuModelMap[e.key]!, e.value)).toList();
  }

  void moveSelectedMenusToComplete(){
    final tempMap = <OrderModel,List<MenuModel>>{};
    for (var order in pendingOrders){
      for (var menu in order.menuItems.toList()){
        if(selectedMenuItems.contains(menu.id)){
          if(!tempMap.containsKey(order)){
            tempMap[order] = [];
          }
          tempMap[order]!.add(menu);
        }
      }
    }
    tempMap.forEach((order, menuList) { 
      for (var menu in menuList){
        setMenuToComplete(order.id, menu.id);
      }
    });
    selectedMenuItems.clear();
  }

  void moveSelectedMenusToIncomplete(){
    final tempMap = <OrderModel,List<MenuModel>>{};
    for (var order in completedOrders){
      for (var menu in order.menuItems.toList()){
        if(selectedMenuItems.contains(menu.id)){
          if(!tempMap.containsKey(order)){
            tempMap[order] = [];
          }
          tempMap[order]!.add(menu);
        }
      }
    }
    tempMap.forEach((order, menuList) { 
      for (var menu in menuList){
        setMenuToIncomplete(order.id, menu.id);
      }
    });
    selectedMenuItems.clear();
  }

  void setMenuToComplete(int orderId, int menuItemId) {
    var orderIndex = pendingOrders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      var order = pendingOrders[orderIndex];
      var menuIndex = order.menuItems.indexWhere((menu) => menu.id == menuItemId);
      if (menuIndex != -1) {
        var menuItem = order.menuItems.removeAt(menuIndex);
        if (order.menuItems.isEmpty) {
          pendingOrders.removeAt(orderIndex);
        } else {
          pendingOrders[orderIndex] = order; // Update the order in the list
        }
        // Add to completed orders
        var completedOrderIndex = completedOrders.indexWhere((o) => o.id == orderId);
        if (completedOrderIndex != -1) {
          completedOrders[completedOrderIndex].menuItems.add(menuItem);
        } else {
          completedOrders.add(OrderModel(id: order.id, table: order.table, menuItems: [menuItem]));
        }
        pendingOrders.refresh();
        completedOrders.refresh();
      }
    }
  }

  void setMenuToIncomplete(int orderId, int menuItemId) {
    var orderIndex = completedOrders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      var order = completedOrders[orderIndex];
      var menuIndex = order.menuItems.indexWhere((menu) => menu.id == menuItemId);
      if (menuIndex != -1) {
        var menuItem = order.menuItems.removeAt(menuIndex);
        if (order.menuItems.isEmpty) {
          completedOrders.removeAt(orderIndex);
        } else {
          completedOrders[orderIndex] = order; // Update the order in the list
        }
        // Add to pending orders
        var pendingOrderIndex = pendingOrders.indexWhere((o) => o.id == orderId);
        if (pendingOrderIndex != -1) {
          pendingOrders[pendingOrderIndex].menuItems.add(menuItem);
        } else {
          pendingOrders.add(OrderModel(id: order.id, table: order.table, menuItems: [menuItem],));
        }
        pendingOrders.refresh();
        completedOrders.refresh();
      }
    }
  }
}
