import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBarMovies extends StatelessWidget {
  final int currentIndex;
  const NavigationBarMovies({super.key, required this.currentIndex});
  void onItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
    }
  }



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) => onItemTap(context, index),
        currentIndex: currentIndex,
        elevation: 0,
        items: const [
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
