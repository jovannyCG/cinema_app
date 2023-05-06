// este archivo lee diferentes modelos y crea una entidad de tipo movie

import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/infrastructure/datasources/models/moviedb/movie_from_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath:(moviedb.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      :'https://www.gmt-sales.com/wp-content/uploads/2015/10/no-image-found.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'https://www.gmt-sales.com/wp-content/uploads/2015/10/no-image-found.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
