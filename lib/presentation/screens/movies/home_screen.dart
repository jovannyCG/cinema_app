import 'package:cinema_app/presentation/views/views.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';
  final int pageIndex;

  const HomePage({super.key, required this.pageIndex});

  final viewRoutes = const [HomeView(), SizedBox(), FavoritesView()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar:  NavigationBarMovies(),
      body: IndexedStack(
        index: pageIndex,
        children:viewRoutes
         
    
      ),
    );
  }
}
