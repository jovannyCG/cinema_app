

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String movieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'ho hay api key';
  
}