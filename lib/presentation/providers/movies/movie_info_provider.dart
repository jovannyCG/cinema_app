import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final movieInfoProvider =  StateNotifierProvider((ref) {
      final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getmovie: movieRepository.getMovieById);
});

typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getmovie;

  MovieMapNotifier({required this.getmovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await getmovie(movieId);
    state = {...state, movieId: movie};
  }
}
