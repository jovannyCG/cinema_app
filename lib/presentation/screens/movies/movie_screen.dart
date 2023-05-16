import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';

  final String movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        ),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          _SliverAppBarMovie(
            movie: movie,
          )
        ],
      ),
    );
  }
}

class _SliverAppBarMovie extends StatelessWidget {
  final Movie movie;
  const _SliverAppBarMovie({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        title: Text(
          movie.title,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.justify,
        ),
        background: Stack(children: [
          SizedBox.expand(
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.7, 1.0],
                        colors: [Colors.transparent, Colors.black87]))),
          ),
          const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topLeft, stops: [
            0.0,
            0.4
          ], colors: [
            Colors.black87,
            Colors.transparent,
          ])))),
        ]),
      ),
    );
  }
}
