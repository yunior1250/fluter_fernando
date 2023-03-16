import 'package:flutter/material.dart';



class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Color.fromARGB(255, 204, 105, 40),
      backgroundColor:    Color.fromARGB(255, 24, 73, 71),
      unselectedItemColor: Color.fromARGB(255, 209, 80, 29),
      currentIndex: 0,
      
      items:const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Calendario'

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Grafical'

        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Usuarios'

        ),
      ],

    );
  }
}