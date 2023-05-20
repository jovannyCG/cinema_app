

import 'package:flutter_riverpod/flutter_riverpod.dart';


// este provider maneja el estado de las busquedas, guarda el query de la busqueda anterior
final searchQueryProvider = StateProvider<String>((ref)=> '');

