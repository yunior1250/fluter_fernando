import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/provider/db_provider.dart';
import 'package:qr_reader/provider/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt
    final uiProvider= Provider.of<UiPRovider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;
    //temporal leer la base de datos
    //DBProvider.db.database;
    final dbProvider = DBProvider();
    dbProvider.init();

    //cambiar para mostrar l apagina respectiva

    switch (currentIndex) {
      case 0:
        return MapaPage();

      case 1:
        return DireccionesPage();

      default:
        return MapaPage();
    }
  }
}
