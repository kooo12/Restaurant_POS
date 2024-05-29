import 'dart:convert';

class MenuModel {
  final int id;
  final String name;
  final int price;
  final String? note; 
  final bool isUrgent;
  final bool isComplete;
  MenuModel({
    required this.id,
    required this.name,
    required this.price,
    this.note,
    this.isUrgent = false,
    this.isComplete = false,
  });

  MenuModel copyWith({
    int? id,
    String? name,
    int? price,
    String? note,
    bool? isUrgent,
    bool? isComplete,
  }) {
    return MenuModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      note: note ?? this.note,
      isUrgent: isUrgent ?? this.isUrgent,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'price': price});
    if(note != null){
      result.addAll({'note': note});
    }
    result.addAll({'isUrgent': isUrgent});
    result.addAll({'isComplete': isComplete});
  
    return result;
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      note: map['note'],
      isUrgent: map['isUrgent'] ?? false,
      isComplete: map['isComplete'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuModel(id: $id, name: $name, price: $price, note: $note, isUrgent: $isUrgent, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MenuModel &&
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.note == note &&
      other.isUrgent == isUrgent &&
      other.isComplete == isComplete;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      note.hashCode ^
      isUrgent.hashCode ^
      isComplete.hashCode;
  }
}
