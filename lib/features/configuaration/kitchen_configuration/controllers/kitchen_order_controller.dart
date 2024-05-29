import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/model/menu_model/menu_model.dart';
import 'package:restruant_pos/features/configuaration/model/order/order_model.dart';
import 'package:restruant_pos/features/configuaration/model/table_model/table_model.dart';

class KitchenOrderController extends GetxController{
  final pendingOrders = [
    OrderModel(id: 1, table: RTable(id: 2, name: 'T2'), menuItems: [MenuModel(id: 2, name: 'ငါးထမင်းနယ်', price: 5000, note: 'ငါးများများ ထည့်ပေးပါ',isUrgent: true),MenuModel(id: 15, name: 'American Fried Riced', price: 8000, note: null),MenuModel(id: 34, name: 'MoteHinNgar', price: 3000),MenuModel(id: 18, name: 'KyarZanHinn', price: 2500),MenuModel(id: 34, name: 'ArrPuSharPu', price: 1500)], isComplete: false),
    OrderModel(id: 2, table: RTable(id: 8, name: 'T8'), menuItems: [MenuModel(id: 32, name: 'Tea', price: 2500, note: 'မလိုင်ထည့်ပေးပါ'),MenuModel(id: 12, name: 'Thai Style Fried Riced', price: 8000, note: 'အစပ်လျှော့')], isComplete: false)
  ].obs;

  final completedOrders = <OrderModel>[].obs;

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
