enum ColumnType { int, num, string, uint8List }

extension ColumnTypeExtension on ColumnType {
  String get string {
    switch (this) {
      case ColumnType.int:
        return "INTEGER";
      case ColumnType.num:
        return "REAL";
      case ColumnType.string:
        return "TEXT";
      case ColumnType.uint8List:
        return "BLOB";
      default:
        return "";
    }
  }
}

class ColumnModel {
  late final String name;
  late final ColumnType type;

  ColumnModel({required this.name, required this.type});

  @override
  String toString() => "$name ${type.string}, ";
}