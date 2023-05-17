import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/infrastructure/models/moviedb/casts_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://vectorified.com/images/facebook-no-profile-picture-icon-27.jpg',
      character: cast.character);
}
