import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:restruant_pos/features/configuaration/model/table_model/table_model.dart';

class Floor {
  int id;
  bool isDefault;
  String name;
  List<RTable> tables;

  Floor({
    required this.id,
    required this.isDefault,
    required this.name,
    required this.tables,
  });

  Floor copyWith({
    int? id,
    bool? isDefault,
    String? name,
    List<RTable>? tables,
  }) {
    return Floor(
      id: id ?? this.id,
      isDefault: isDefault ?? this.isDefault,
      name: name ?? this.name,
      tables: tables ?? this.tables,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'isDefault': isDefault});
    result.addAll({'name': name});
    result.addAll({'tables': tables.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory Floor.fromMap(Map<String, dynamic> map) {
    return Floor(
      id: map['id']?.toInt() ?? 0,
      isDefault: map['isDefault'] ?? false,
      name: map['name'] ?? '',
      tables: List<RTable>.from(map['tables']?.map((x) => RTable.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Floor.fromJson(String source) => Floor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Floor(id: $id, isDefault: $isDefault, name: $name, tables: $tables)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Floor &&
      other.id == id &&
      other.isDefault == isDefault &&
      other.name == name &&
      listEquals(other.tables, tables);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      isDefault.hashCode ^
      name.hashCode ^
      tables.hashCode;
  }
}
