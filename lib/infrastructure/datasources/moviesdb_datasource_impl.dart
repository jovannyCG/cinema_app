

//implementacion del datasource de the movieDB
import 'package:cinema_app/config/constants/enviroment.dart';
import 'package:cinema_app/domain/datasources/movies_datasource.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/infrastructure/datasources/models/moviedb/moviedb_response.dart';
import 'package:cinema_app/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';

class MoviedbDatasourceImpl extends  MoviesDatasource{

  //cliente de peticiones htpp para the moviedb
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.movieDbKey,
      'language': 'es-MX'
    }
  ));


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    //peticion http
    final resp = await dio.get('/movie/now_playing');
    //almacenamiento de la respuesta json de tipp moviedb
    final moviedbResponse = MovieDbResponse.fromJson(resp.data);
    // mapeo de la respuesta para convertirla a una respuesta de tipo movie usando el mapper
    final List<Movie> movies =moviedbResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
  ).toList();

    return movies;
  }

  
}