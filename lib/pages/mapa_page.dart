import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderfer/providers/scan_list_provider.dart';

class MapPageScreen extends StatelessWidget {
  const MapPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    final scans = scanProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigo,
            child: Text(
              '${scans[index].id}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: const Text(
            'Dirección de localización',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(scans[index].valor),
          trailing: const Icon(
            Icons.keyboard_arrow_right_rounded,
          ),
          onTap: () {
            print(scans[index].id);
          },
        ),
      ),
    );
  }
}
