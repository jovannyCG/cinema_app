import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/delegates/search_delegate_movie.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppBarMovie extends ConsumerWidget {
  const AppBarMovie({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie,
                color: colors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'CINEMA APP',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    final movieRepository = ref.read(movieRepositoryProvider);
                    final searchQuqery = ref.read(searchQueryProvider);
                    showSearch<Movie?>(
                      //mostrar la busqueda anterior
                      query: searchQuqery,
                            context: context,
                            delegate: SearchMovieDelegate(
                                searchMovies: (query){
                                  //guardar el query en el provider
                                  ref.read(searchQueryProvider.notifier).update((state) => query);
                                  //realizar la busqueda
                                  return movieRepository.searchMovie(query);
                                }))
                        .then((movie) {
                      if (movie == null) return;
                      context.push('/movie/${movie.id}');
                    });
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
  }
}
