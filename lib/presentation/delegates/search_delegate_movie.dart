import 'package:flutter/material.dart';
//implementacipon de las busquedas

class SearchMovieDelegate extends SearchDelegate {
  //cambiar la frase que aparece al abrir la busqueda
  @override
  String get searchFieldLabel => 'Buscar película';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [const Text('buildActions')];
  }

//este metodo construye un icono que aparece al realizar la busqueda
  @override
  Widget? buildLeading(BuildContext context) {
    return const Text('buildLeading');
  }

  //este metodo construye los resultados de la buqueda
  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  // este metodo provee sugerencias en base a la busqueda realiza
  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('buildSuggestions');
  }
}
