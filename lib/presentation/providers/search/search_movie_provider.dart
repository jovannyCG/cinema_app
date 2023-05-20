import 'package:cinema_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

// este provider maneja el estado de las busquedas, guarda el query de la busqueda anterior
final searchQueryProvider = StateProvider<String>((ref) => '');

// provider maneja el resultado de las busquedas anteriores hasta que se reliza una nueva, si se realiza la misma
// no hace una nueva peticion, es decir; mantiene el estado de las busquedas en memoria 
final searchedMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return SearchMoviesNotifier(
      ref: ref, searchMovies: movieRepository.searchMovie);
});

//definicion de la funcion para actualizar el estado
typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  SearchMoviesCallBack searchMovies;
  final Ref ref;
  SearchMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }) : super([]);

//funcion para realizar la busqueda de peliculas
  Future<List<Movie>> searchMoviesByQuery(String query) async {
    //obtener las peliculas que se añadiran al estado
    final List<Movie> movies = await searchMovies(query);
    // actualizar el provider/ guardar el query en el provider de busqueda
    ref.read(searchQueryProvider.notifier).update((state) => query);
    // se añaden las peliculas al estado
    state = movies;

    return movies;
  }
}
