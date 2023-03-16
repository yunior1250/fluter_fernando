import 'package:componentes/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:  [
         const ListTile(
            leading: Icon(Icons.abc,color: AppTheme.primary,),
            title: Text('soy un titulo'),
            subtitle: Text('Labore laborum ullamco laboris incididunt minim adipisicing aute.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                TextButton(
                  onPressed: () {},
                 child:const Text('Cancel'),
                
                 ),


                 TextButton(
                  onPressed: () {},
                 child: const Text('Ok')
                 )
              ],
            ),
          )
        ]
        ),
    );
  }
}



