
import 'package:componentes/models/menu_option.dart';
import 'package:componentes/routes/app_routes.dart';
import 'package:componentes/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final menuOptions  = AppRoutes.menuOptions;
    return  Scaffold(
      appBar: AppBar(
        title:const  Text('Componentes en flutter'),
        elevation: 0,
      ),
      body:ListView.separated(
        itemBuilder: (context, i) => ListTile(
          leading:  Icon(menuOptions[i].icon ,color: AppTheme.primary ) ,
          title: Text(menuOptions[i].name),
          onTap: () {
          /*   final route= MaterialPageRoute(builder: (context) => Listview1Screen(),);
            Navigator.push(context, route);// */
            Navigator.pushNamed(context, menuOptions[i].route);
            
          },
        ),
        separatorBuilder:(_, __) => const Divider() ,
        itemCount: menuOptions.length,

      )
      
    );
  }
}