import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fechMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fechMoreMovies: fechMoreMovies);
});
final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fechMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fechMoreMovies: fechMoreMovies);
});

final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fechMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifier(fechMoreMovies: fechMoreMovies);
});

final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fechMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(fechMoreMovies: fechMoreMovies);
});

typedef MovieCallback = Future <List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
MovieCallback fechMoreMovies;

  MoviesNotifier({
    required this.fechMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    if(isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fechMoreMovies(page: currentPage);
    state =[...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
