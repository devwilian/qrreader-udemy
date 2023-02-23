import 'package:flutter/material.dart';
import 'package:qrreaderfer/providers/db_provider.dart';

class CustomListWidget extends StatelessWidget {
  final List<ScanResultModel> scans;
  const CustomListWidget({Key? key, required this.scans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(scans[index].valor),
        subtitle: Text('${scans[index].id}'),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
        onTap: () {
          print('object');
        },
      ),
    );
  }
}
