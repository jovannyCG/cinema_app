import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPayingMoviesProvider = ref.watch(nowPlayingMoviesProvider);
  if (nowPayingMoviesProvider.isEmpty) return [];
  return nowPayingMoviesProvider.sublist(0, 6);
});
