import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderfer/providers/scan_list_provider.dart';
import 'package:qrreaderfer/utils/utils.dart';

class CustomFloatingButtonWidget extends StatelessWidget {
  const CustomFloatingButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanProvider =
        Provider.of<ScanListProvider>(context);
    return FloatingActionButton(
      onPressed: () async {
        // String barCodeScan = 'https://www.youtube.com/watch?v=xtYhrOqRsKY';
        // String barCodeScan = 'geo:36.73518711699918, -4.4903455499298675';
        String barCodeScan = 'Texto Comun';
        // String barCodeScan = '-1';
        // String barCodeScan = '36.72390930733272, -4.433394595897664';
        // String barCodeScan = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        scanProvider.nuevoScan(barCodeScan);
        if(barCodeScan == -1) return;
        final scan = await scanProvider.nuevoScan(barCodeScan);
        launchUrlScan(context, scan);
      },
      child: const Icon(Icons.qr_code),
    );
  }
}
