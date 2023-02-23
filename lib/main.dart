import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderfer/pages/home_page.dart';
import 'package:qrreaderfer/pages/mapa_page.dart';
import 'package:qrreaderfer/providers/db_provider.dart';
import 'package:qrreaderfer/providers/scan_list_provider.dart';
import 'package:qrreaderfer/providers/ui_provider.dart';
import 'package:qrreaderfer/theme/theme_primary.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UIProvider()),
        ChangeNotifierProvider(create: (context) => ScanListProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePageScreen(),
          'map': (context) => const MapPageScreen()
        },
        theme: AppTheme.lightTheme
      ),
    );
  }
}