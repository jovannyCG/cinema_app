import '../entities/actor.dart';

// este archivo llama los datasources
abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
