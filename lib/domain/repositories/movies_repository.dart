import 'package:cinema_app/domain/entities/movie.dart';


// este archivo llama los datasources 
abstract class MovieRepository{

  Future<List<Movie>>getNowPlaying({int page = 1});
}