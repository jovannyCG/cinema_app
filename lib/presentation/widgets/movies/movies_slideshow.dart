import 'package:card_swiper/card_swiper.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSlide extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlide({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemBuilder: (context, index) => _Slide(
          movie: movies[index],
        ),
        itemCount: movies.length,
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
