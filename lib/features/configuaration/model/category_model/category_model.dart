import 'dart:convert';

import 'package:restruant_pos/features/configuaration/model/menu_model/menu_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final String note;
  final MenuModel menus;
  CategoryModel({
    required this.id,
    required this.name,
    required this.note,
    required this.menus,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    String? note,
    MenuModel? menus,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      note: note ?? this.note,
      menus: menus ?? this.menus,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'note': note});
    result.addAll({'menus': menus.toMap()});
  
    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      note: map['note'] ?? '',
      menus: MenuModel.fromMap(map['menus']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, note: $note, menus: $menus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryModel &&
      other.id == id &&
      other.name == name &&
      other.note == note &&
      other.menus == menus;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      note.hashCode ^
      menus.hashCode;
  }
}
