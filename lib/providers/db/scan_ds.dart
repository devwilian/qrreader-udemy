// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:qrreaderfer/providers/db/adapters/scan_adapter.dart';

// class ScanDataSource {
//   const ScanDataSource();

//   Future<int> createScan(ScanDocument scan) async {
//     final boxScan = await Hive.openBox<ScanDocument>('scans');
//     return boxScan.add(scan);
//   }

//   Future<List<ScanDocument>> getScan() async {
//     final boxScan = await Hive.openBox<ScanDocument>('scans');
//     return boxScan.values.toList();
//   }
// }
