

import 'package:cinema_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final isDarkmodeProvider = StateProvider((ref) => false);
final selectedColor = StateProvider((ref) => 0);



final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
  );


class ThemeNotifier extends StateNotifier<AppTheme>{

  ThemeNotifier(): super(AppTheme());


}
