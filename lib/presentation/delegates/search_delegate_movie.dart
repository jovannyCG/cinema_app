import 'package:animate_do/animate_do.dart';
import 'package:cinema_app/config/helpers/human_formats.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';
//implementacipon de las busquedas

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallBack searchMovies;

  SearchMovieDelegate({required this.searchMovies});

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
        child: IconButton(
            onPressed: () => query = '', icon: const Icon(Icons.clear)),
      )
    ];
  }

//este metodo construye un icono/boton que aparece al realizar la busqueda, ese icono hace una accion espesifíca, en este caso
//vuelve a la pantalla principal
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_outlined));
  }

  //este metodo construye los resultados de la buqueda
  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  // este metodo provee sugerencias en base a la busqueda realiza
  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: searchMovies(query),
        builder: (context, snapshot) {
          final movies = snapshot.data ?? [];

          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _MovieSearchItem(
                  movie: movies[index], 
                  onMovieSelected: close,
                );
              });
        });
  }
}

class _MovieSearchItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;
  const _MovieSearchItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      //al seleccionar una pelicula de la lista onTap devuelve la pantalla de la pelicula seleccionada
      onTap: (){onMovieSelected(context, movie);},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(children: [
          //Image
          SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    movie.posterPath,
                    loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child),
                    )
                    )
                    ),
                    const SizedBox(width: 10,),
          //descricpción
          SizedBox(
            width: size.width *0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textStyle.titleMedium,),
                (movie.overview.length > 100)
                ? Text('${movie.overview.substring(0,100)}...' )
                :Text(movie.overview),
                Row(children: [
                  Icon(Icons.star_half_rounded, color: Colors.yellow.shade800,),
                  const SizedBox(width: 5,),
                  Text(HumanFormats.number(movie.voteAverage, 1),
                  style: textStyle.bodyMedium!.copyWith(color:Colors.yellow.shade900, ),
                  )
                ],)
                
              ],
            ))
        ]),
      ),
    );
  }
}
