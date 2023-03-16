import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Column(children:  [
        const Image(image: AssetImage('assets/dbz.jpg')),
        const Title(),
        //button section
        const ButtonSection(),
        //description section
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text('La Casa Kame (カメハウス, Kame Hausu, Kame House) o Casa de la Tortuga, es una casa pequeña que se encuentra en una isla en el medio del océano. Esta casa es propiedad de Kame-Sen nin, y de Lunch temporalmente. Es también el lugar donde Krilin, Número 18 y su hija, Marron viven durante el Arco de Majin Boo')
          )

      ]),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Text(
              'Casa Kame House DBZ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Donde de Crio Goku', style: TextStyle(color: Colors.black45)),
          ]),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.orange),
          Text('99')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const[
          CustomButton(icon: Icons.call,text: 'Call'),
          CustomButton(icon: Icons.roofing_outlined,text: 'Route'),
          CustomButton(icon: Icons.share,text: 'Share'),
         
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomButton({
    Key? key, required this.icon, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon,color: Colors.red,),
        Text(this.text,style: const TextStyle(color: Colors.red)),
      ],
    );
  }
}
