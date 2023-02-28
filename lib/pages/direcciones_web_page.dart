import 'package:flutter/material.dart';
import 'package:qrreaderfer/widgets/scan_tiles.dart';

class DireccionesWebScreen extends StatefulWidget {
  const DireccionesWebScreen({Key? key}) : super(key: key);

  @override
  State<DireccionesWebScreen> createState() => _DireccionesWebScreenState();
}

class _DireccionesWebScreenState extends State<DireccionesWebScreen> {
  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'http');
  }
}
