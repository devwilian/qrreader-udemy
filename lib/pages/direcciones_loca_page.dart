import 'package:flutter/material.dart';
import 'package:qrreaderfer/widgets/scan_tiles.dart';

class DireccionesLocalizacionesScreen extends StatelessWidget {
  const DireccionesLocalizacionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'geo');
  }
}
