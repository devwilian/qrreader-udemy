import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderfer/pages/dismissible.dart';
import 'package:qrreaderfer/pages/pages.dart';
import 'package:qrreaderfer/providers/db_provider.dart';
import 'package:qrreaderfer/providers/scan_list_provider.dart';
import 'package:qrreaderfer/providers/ui_provider.dart';
import 'package:qrreaderfer/widgets/widgets.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Eliminar'),
                    content: const Text('¿Seguro quiere eliminar todo?'),
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
                          scanListProvider.deleteAllScans();
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
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingButtonWidget(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context, listen: false);
    final scanListProvider = Provider.of<ScanListProvider>(context);

    final currentIndex = uiProvider.index;
    switch (currentIndex) {
      case 0:
        scanListProvider.getScanByType('geo');
        return const MapPageScreen();
      case 1:
        scanListProvider.getScanByType('http');
        return const DireccionesPageScreen();
      default:
        return Container();
    }
  }
}
