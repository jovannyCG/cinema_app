


import 'package:cinema_app/infrastructure/datasources/moviesdb_datasource_impl.dart';
import 'package:cinema_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//este respositorio es inmutable (solo lectura)
final movieRepositoryProvider = Provider((ref)  {

  return MovieRepositoryImplementation(MoviedbDatasourceImpl());
});