import 'dart:convert';

class RTable {
  int id;
  String name;
  bool isOCcupied = false;
  bool isReserved = false;
  RTable({
    required this.id,
    required this.name,
     isOCcupied,
     isReserved,
  });

  RTable copyWith({
    int? id,
    String? name,
    bool? isOCcupied,
    bool? isReserved,
  }) {
    return RTable(
      id: id ?? this.id,
      name: name ?? this.name,
      isOCcupied: isOCcupied ?? this.isOCcupied,
      isReserved: isReserved ?? this.isReserved,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'isOCcupied': isOCcupied});
    result.addAll({'isReserved': isReserved});
  
    return result;
  }

  factory RTable.fromMap(Map<String, dynamic> map) {
    return RTable(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      isOCcupied: map['isOCcupied'] ?? false,
      isReserved: map['isReserved'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RTable.fromJson(String source) => RTable.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RTable(id: $id, name: $name, isOCcupied: $isOCcupied, isReserved: $isReserved)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RTable &&
      other.id == id &&
      other.name == name &&
      other.isOCcupied == isOCcupied &&
      other.isReserved == isReserved;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      isOCcupied.hashCode ^
      isReserved.hashCode;
  }
}
