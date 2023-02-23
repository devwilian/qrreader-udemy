// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScanDocumentAdapter extends TypeAdapter<ScanDocument> {
  @override
  final int typeId = 0;

  @override
  ScanDocument read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScanDocument(
      id: fields[0] as int,
      tipo: fields[1] as String,
      valor: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ScanDocument obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.tipo)
      ..writeByte(2)
      ..write(obj.valor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScanDocumentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
