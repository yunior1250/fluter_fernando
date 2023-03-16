import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Avatars'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child:   CircleAvatar(
              backgroundColor: Colors.orange[900],
              child:  const Text('SL'),
            ),
          )
        ],

      ),
      body:const Center(
         child: CircleAvatar(
          maxRadius: 150,
          backgroundImage: NetworkImage('https://www.quever.news/u/fotografias/m/2021/11/13/f638x638-18737_76904_4924.jpg'),
         )
      ),
    );
  }
}