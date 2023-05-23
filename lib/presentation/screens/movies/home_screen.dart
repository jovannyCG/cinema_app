

import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  static const name = 'home-page';
  final Widget childView;

  const HomePage({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: const NavigationBarMovies(),
      body: childView,
      //body: HomeView(),
    );
  }
}


