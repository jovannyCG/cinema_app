import 'package:flutter/material.dart';

class NavigationBarMovies extends StatelessWidget {
  const NavigationBarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation: 0, items: const [
      BottomNavigationBarItem(
          label: 'Home', icon: Icon(Icons.home_max_outlined)),
      BottomNavigationBarItem(
          label: 'Categorias', icon: Icon(Icons.label_outline)),
      BottomNavigationBarItem(
          label: 'Favoritos',
          icon: Icon(
            Icons.favorite_outline,
          )),
    ]);
  }
}
