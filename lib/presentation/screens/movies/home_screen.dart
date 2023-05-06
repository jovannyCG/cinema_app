
import 'package:cinema_app/config/constants/enviroment.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  static const name = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(Enviroment.movieDbKey),
      ),
    );
  }
}
