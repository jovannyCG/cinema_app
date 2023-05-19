import 'package:cinema_app/presentation/delegates/search_delegate_movie.dart';
import 'package:cinema_app/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarMovie extends ConsumerWidget {
  const AppBarMovie({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(Icons.movie, color: colors.primary,),
            const SizedBox(width: 5,),
            Text('CINEMA APP', style: titleStyle,),
            const Spacer(),
            IconButton(onPressed: (){
              final movieRepository = ref.read(movieRepositoryProvider);
                showSearch(context: context, 
                delegate: SearchMovieDelegate(searchMovies: movieRepository.searchMovie));

            }, icon: const Icon(Icons.search))
          ],
        ),
      ),
      
      ),
    );
  }
}
