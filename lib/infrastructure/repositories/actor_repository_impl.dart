

import 'package:cinema_app/domain/datasources/actors_datasource.dart';
import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/domain/repositories/actors_repository.dart';


//implementacion del repositorio para llamar el datasource, no importa el tipo de datasource
class ActorRepositoryImplementation extends ActorsRepository{
  final ActorsDatasource datasource;

  ActorRepositoryImplementation(this.datasource);
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
  return datasource.getActorsByMovie(movieId);
  }

}