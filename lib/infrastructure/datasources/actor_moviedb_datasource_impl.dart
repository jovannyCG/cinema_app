import 'package:cinema_app/config/constants/enviroment.dart';
import 'package:cinema_app/domain/datasources/actors_datasource.dart';
import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/infrastructure/mappers/actor_mapper.dart';
import 'package:cinema_app/infrastructure/models/moviedb/casts_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasourceImpl extends ActorsDatasource {
  //cliente de peticiones htpp para obtener los actores desde the moviedb
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.movieDbKey,
        'language': 'es-MX'
      }));

  List<Actor> _jsonToActors(Map<String, dynamic> json) {
    //almacenamiento de la respuesta json de tipp actormoviedb
    final castResponse = CreditsResponse.fromJson(json);
    // mapeo de la respuesta para convertirla a una respuesta de tipo actor usando el mapper
    final List<Actor> actors = castResponse.cast
        .map((castResponse) => ActorMapper.castToEntity(castResponse))
        .toList();

    return actors;
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final resp = await dio.get(
      '/movie/$movieId/credits',
    );
    return _jsonToActors(resp.data);
  }
}
