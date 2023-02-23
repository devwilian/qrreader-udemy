import 'package:hive/hive.dart';

part 'scan_adapter.g.dart';

@HiveType(typeId: 0)
class ScanDocument extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String tipo;

  @HiveField(2)
  String valor;

  ScanDocument({required this.id, required this.tipo, required this.valor});

}
