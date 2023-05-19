import 'package:animate_do/animate_do.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';
//implementacipon de las busquedas

class SearchMovieDelegate extends SearchDelegate<Movie?>{
  //cambiar la frase que aparece al abrir la busqueda
  @override
  String get searchFieldLabel => 'Buscar película';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
     //if(query.isNotEmpty)
      FadeIn(
        animate: query.isNotEmpty,
        duration: const Duration(milliseconds: 500),
        child: IconButton(onPressed: ()=> query ='', 
        icon: const Icon(Icons.clear)),
      )
    ];
  }

//este metodo construye un icono/boton que aparece al realizar la busqueda, ese icono hace una accion espesifíca
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);

    }, icon: const Icon(Icons.arrow_back_outlined));
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
