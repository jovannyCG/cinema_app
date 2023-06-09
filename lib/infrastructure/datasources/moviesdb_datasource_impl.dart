
import 'package:cinema_app/config/constants/enviroment.dart';
import 'package:cinema_app/domain/datasources/movies_datasource.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinema_app/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinema_app/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';

//implementacion del datasource de the movieDB
class MoviedbDatasourceImpl extends MoviesDatasource {
  //cliente de peticiones htpp para the moviedb
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.movieDbKey,
        'language': 'es-MX'
      }));
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    //almacenamiento de la respuesta json de tipp moviedb
    final moviedbResponse = MovieDbResponse.fromJson(json);
    // mapeo de la respuesta para convertirla a una respuesta de tipo movie usando el mapper
    final List<Movie> movies = moviedbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    //peticion http
    final resp =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    return _jsonToMovies(resp.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    //peticion http
    final resp =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovies(resp.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    //peticion http
    final resp =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(resp.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    //peticion http
    final resp =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(resp.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final resp = await dio.get('/movie/$id');

  if(resp.statusCode !=200 ) throw Exception('Movie whith id: $id not found');
  final movieDT =MovieDetails.fromMap(resp.data);
  final Movie movie = MovieMapper.movieDetailsToEntity(movieDT);

    return movie;
  }
  
  @override
  Future<List<Movie>> searchMovie(String query) async{
    if (query.isEmpty) return [];
    final resp =
        await dio.get('/search/movie', queryParameters: {'query': query});
    return _jsonToMovies(resp.data);
  }
}
