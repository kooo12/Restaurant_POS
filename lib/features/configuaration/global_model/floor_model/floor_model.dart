import 'package:restruant_pos/features/configuaration/global_model/table_model/table_model.dart';

class Floor {
  int id;
  String name;
  List<RTable> tables;

  Floor({required this.id, required this.name, required this.tables});
}