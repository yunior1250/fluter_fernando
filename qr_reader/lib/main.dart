import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/mapa_page.dart';
import 'package:qr_reader/provider/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiPRovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home':(_)=>HomePage(),
          'mapa':(_)=>MapaPage()
        },
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
          floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.greenAccent)
          ),
      
      ),
    );
  }
}
