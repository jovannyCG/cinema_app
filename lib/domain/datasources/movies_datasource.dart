

import 'package:cinema_app/domain/entities/movie.dart';

//origenes de datos 
abstract class MovieDatasource{

  Future<List<Movie>>getNowPlaying({int page = 1});
}