import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: NavigationBarMovies(),
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read( popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final moviesNowPlayer = ref.watch(nowPlayingMoviesProvider);
    final movies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
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
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}
