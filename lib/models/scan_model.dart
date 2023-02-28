import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  LatLng getLatLng(){
    final latLong = this.valor.substring(4).split(',');
    return LatLng(double.parse(latLong[0]),double.parse(latLong[1]));
  }

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
