
import 'package:cinema_app/domain/entities/actor.dart';
//origenes de datos de actores
abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
