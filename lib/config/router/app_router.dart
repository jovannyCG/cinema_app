import 'package:cinema_app/presentation/screens/screens.dart';
import 'package:cinema_app/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

// configuración de go_ router
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomePage.name,
      path: '/',
      builder: (context, state) => const HomePage(childView: FavoritesView(),),
      routes: [
        GoRoute(
      name: MovieScreen.name,
      path: 'movie/:id',
      builder: (context, state) {
        final movieId = state.pathParameters['id'] ?? 'no-id';
        return  MovieScreen(movieId: movieId,);
      }
    ),
      ]
    ),
    
  ],
);
