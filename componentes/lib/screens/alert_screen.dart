import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);
  void displayDialogIos(BuildContext context){
    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
       builder: (context){

        return CupertinoAlertDialog(
          title:const Text('title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('este es un comentario'),
              SizedBox(height: 10,),
              FlutterLogo(size: 100,)

            ],
          ),
          actions: [
            TextButton(
              onPressed: ()=>Navigator.pop(context),
               child: const Text('cancelar',style: TextStyle(color: Colors.red),)
               ),
               TextButton(
              onPressed: ()=>Navigator.pop(context),
               child: const Text('ok')
               )
          ],

        );
       }
       );

  }




  void displayDialogAndroid(BuildContext context){ 
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const  Text('titulo'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('datos de la aplicaion'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],
          ),
          actions: [
            TextButton(
              onPressed:()=>Navigator.pop(context),
              child: const Text('cancelar'),
            ),
              TextButton(
              onPressed:()=>Navigator.pop(context),
              child: const Text('ok'),
            )
          ],
          
        );
      }

    );

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          /*
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: const StadiumBorder(),
            elevation: 0
          ),
*/
          child: const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child:  Text('Mostrar alerta',style: TextStyle(fontSize: 15),),
          ),
          //onPressed: ()=> displayDialogAndroid(context)
           //onPressed: ()=> displayDialogIos(context)
           onPressed: () => !Platform.isAndroid
           ? displayDialogAndroid(context)
           : displayDialogIos(context)
        
        )

      ),
      floatingActionButton: FloatingActionButton(
        child:  const  Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },

      ),
    );
  }
}