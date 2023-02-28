import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderfer/providers/ui_provider.dart';

class CustomNavigationBarWidget extends StatelessWidget {
  const CustomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final int opt = uiProvider.index;
    return BottomNavigationBar(
      onTap: (opt) => uiProvider.index = opt,
      currentIndex: opt,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_fields_rounded),
          label: 'Texto',
        ),
      ],
    );
  }
}
