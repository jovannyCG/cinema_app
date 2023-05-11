

import 'package:cinema_app/domain/entities/movie.dart';

//origenes de datos 
abstract class MoviesDatasource{

  Future<List<Movie>>getNowPlaying({int page = 1});
    Future<List<Movie>>getPopular({int page = 1});
}