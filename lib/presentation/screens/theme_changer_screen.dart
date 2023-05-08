import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemePage extends ConsumerWidget {
  static const String name = 'theme_screen';

  const ThemePage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    //final isDarkMode = ref.watch(isDarkmodeProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkmode;
    return Scaffold(

      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
            ref.read(themeNotifierProvider.notifier).toggleDarkMode();
                
              //ref.read(isDarkmodeProvider.notifier).update((isDarkMode) => !isDarkMode);
            },
            icon: isDarkMode
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
   // final int indexColor = ref.watch(selectedColor);
    final indexColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
              activeColor: color,
              title: Text(
                'Este color',
                style: TextStyle(color: color),
              ),
              subtitle: Text('E${color.value}'),
              value: index,
              groupValue: indexColor,
              onChanged: (value) {
               // ref.read(selectedColor.notifier).state = index;
                ref.watch(themeNotifierProvider.notifier).changeColorIndex(index);
              });
        });
  }
}
