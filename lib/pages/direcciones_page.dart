import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderfer/providers/scan_list_provider.dart';
import 'package:qrreaderfer/widgets/custom_list.dart';

class DireccionesPageScreen extends StatefulWidget {
  const DireccionesPageScreen({Key? key}) : super(key: key);

  @override
  State<DireccionesPageScreen> createState() => _DireccionesPageScreenState();
}

class _DireccionesPageScreenState extends State<DireccionesPageScreen> {
  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanProvider =
        Provider.of<ScanListProvider>(context);
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
            'Direccion web',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(scans[index].valor),
          trailing: const Icon(
            Icons.keyboard_arrow_right_rounded,
          ),
          onTap: () {
            print('object');
          },
        ),
      ),
    );
  }
}
