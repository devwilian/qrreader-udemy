import 'package:flutter/material.dart';
import 'package:qrreaderfer/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchUrlScan(BuildContext context, ScanResultModel scan) async {
  final url = Uri.parse(scan.valor);
  if(scan.tipo == 'http'){
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  } else if(scan.tipo == 'geo'){
    Navigator.pushNamed(context, 'map', arguments: scan);
  } else {
    return;
  }
}