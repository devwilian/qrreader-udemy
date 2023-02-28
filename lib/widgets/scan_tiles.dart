import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderfer/providers/scan_list_provider.dart';
import 'package:qrreaderfer/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider =
        Provider.of<ScanListProvider>(context);
    final scans = scanProvider.scans;
    final String title;
    switch (tipo) {
      case 'http':
        title = 'Dirección web';
        break;
      case 'geo':
        title = 'Dirección de localización';
        break;
      default:
        title = 'Texto';
        break;
    }

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => GestureDetector(
        onLongPress: () {
          showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Eliminar'),
                    content: const Text('¿Seguro quiere eliminar esta dirección?'),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Eliminar',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          final scanListProvider =
                              Provider.of<ScanListProvider>(context,
                                  listen: false);
                          scanListProvider.deleteScanById(scans[index].id ?? -1);
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
        },
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
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(scans[index].valor),
          trailing: Icon(
            tipo == 'geo' ? Icons.near_me : Icons.keyboard_arrow_right_rounded,
          ),
          onTap: () => launchUrlScan(context, scans[index]),
        ),
      ),
    );
  }
}