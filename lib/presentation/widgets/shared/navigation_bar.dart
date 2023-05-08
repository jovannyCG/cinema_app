import 'package:flutter/material.dart';

class NavigationBarMovies extends StatelessWidget {
  const NavigationBarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const[
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home_max_outlined,color: Colors.black,)),
      BottomNavigationBarItem(
        label: 'Categorias',
        icon: Icon(Icons.label_outline ,color: Colors.black,)),
         BottomNavigationBarItem(
        label: 'Favoritos',
        icon: Icon(Icons.favorite_outline, color: Colors.black,)),

         BottomNavigationBarItem(
        label: 'Tema',
        icon: Icon(Icons.dark_mode, color: Colors.black,)),


      
      
    ]);
  }
}