import 'package:flutter/material.dart';
import 'package:qrreaderfer/models/scan_model.dart';
import 'package:qrreaderfer/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanResultModel> scans = [];
  ScanResultModel? scan;
  String type = 'http';

  Future<ScanResultModel> nuevoScan(String valor) async {
    final newScan = ScanResultModel(valor: valor);
    final res = await DBProvider.db.nuevoScan(newScan);
    newScan.id = res;
    if (type == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  getAllScans() async {
    final res = await DBProvider.db.getScans();
    scans = res;
    notifyListeners();
  }

  getScanById(int id) async {
    final res = await DBProvider.db.getScanById(id);
    scan = res;
    notifyListeners();
  }

  getScanByType(String valor) async {
    final res = await DBProvider.db.getScansByType(valor);
    type = valor;
    scans = res;
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAll();
    getAllScans();
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteById(id);
    getAllScans();
    notifyListeners();
  }

  deleteScanByType() async {
    await DBProvider.db.deleteByType(type);
    getAllScans();
    notifyListeners();
  }
}
