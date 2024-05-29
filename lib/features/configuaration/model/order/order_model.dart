import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:restruant_pos/features/configuaration/model/menu_model/menu_model.dart';
import 'package:restruant_pos/features/configuaration/model/table_model/table_model.dart';

class OrderModel {
  final int id;
  final RTable table;
  final List<MenuModel> menuItems;
  final bool isComplete;
  OrderModel({
    required this.id,
    required this.table,
    required this.menuItems,
    this.isComplete = false,
  });


  OrderModel copyWith({
    int? id,
    RTable? table,
    List<MenuModel>? menuItems,
    bool? isComplete,
  }) {
    return OrderModel(
      id: id ?? this.id,
      table: table ?? this.table,
      menuItems: menuItems ?? this.menuItems,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'table': table.toMap()});
    result.addAll({'menuItems': menuItems.map((x) => x.toMap()).toList()});
    result.addAll({'isComplete': isComplete});
  
    return result;
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id']?.toInt() ?? 0,
      table: RTable.fromMap(map['table']),
      menuItems: List<MenuModel>.from(map['menuItems']?.map((x) => MenuModel.fromMap(x))),
      isComplete: map['isComplete'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(id: $id, table: $table, menuItems: $menuItems, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderModel &&
      other.id == id &&
      other.table == table &&
      listEquals(other.menuItems, menuItems) &&
      other.isComplete == isComplete;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      table.hashCode ^
      menuItems.hashCode ^
      isComplete.hashCode;
  }
}
