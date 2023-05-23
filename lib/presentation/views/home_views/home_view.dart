import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final moviesNowPlayer = ref.watch(nowPlayingMoviesProvider);
    final movies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final toRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: AppBarMovie(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlide(
                movies: movies,
              ),
              MovieHorizontalListView(
                  title: 'En cines',
                  subtitle: 'lunes 20',
                  movies: moviesNowPlayer,
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  }),
              MovieHorizontalListView(
                  title: 'Populares',
                  subtitle: '',
                  movies: popularMovies,
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  }),
              MovieHorizontalListView(
                  title: 'Proximamente',
                  subtitle: '',
                  movies: upcomingMovies,
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  }),
              MovieHorizontalListView(
                  title: 'Mejor Valoradas',
                  subtitle: 'Desde siempre',
                  movies: toRatedMovies,
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  }),
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}