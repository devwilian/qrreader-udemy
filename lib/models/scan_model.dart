import 'dart:convert';

class ScanResultModel {
  ScanResultModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    if (valor.contains('http')) {
      tipo = "http";
    } else if (valor.contains("geo")) {
      tipo = "geo";
    } else {
      tipo = "any";
    }
  }

  int? id;
  String? tipo;
  String valor;

  factory ScanResultModel.fromRawJson(String str) =>
      ScanResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScanResultModel.fromJson(Map<String, dynamic> json) => ScanResultModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
