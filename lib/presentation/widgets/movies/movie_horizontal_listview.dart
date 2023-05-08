import 'package:cinema_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;
  const MovieHorizontalListView(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null && subtitle != null) _MovieTitle(title, subtitle),
        ],
      ),
    );
  }
}

class _MovieTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _MovieTitle(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subtitle != null) 
          FilledButton.tonal (
            style: const ButtonStyle( visualDensity: VisualDensity.compact),
            onPressed: (){},
            child: Text(subtitle!)),
        ],
      ),
    );
  }
}
