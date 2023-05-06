

//implementacion del datasource de the movieDB
import 'package:cinema_app/config/constants/enviroment.dart';
import 'package:cinema_app/domain/datasources/movies_datasource.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends  MoviesDatasource{

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
    final resp = await dio.get('/movie/now_playing');
    final List<Movie> movies =[];
    return[];
  }

  
}