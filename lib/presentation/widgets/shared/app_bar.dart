import 'package:cinema_app/presentation/delegates/search_delegate_movie.dart';
import 'package:flutter/material.dart';

class AppBarMovie extends StatelessWidget {
  const AppBarMovie({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(Icons.movie, color: colors.primary,),
            const SizedBox(width: 5,),
            Text('CINEMA APP', style: titleStyle,),
            const Spacer(),
            IconButton(onPressed: (){
                showSearch(context: context, 
                delegate: SearchMovieDelegate());

            }, icon: const Icon(Icons.search))
          ],
        ),
      ),
      
      ),
    );
  }
}
