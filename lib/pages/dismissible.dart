import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderfer/providers/scan_list_provider.dart';

class CustomDismissible extends StatelessWidget {
  const CustomDismissible({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Dismissible(
          key: UniqueKey(),
          child: ListTile(
            title: Text('1'),
          )),
    );
  }
}
