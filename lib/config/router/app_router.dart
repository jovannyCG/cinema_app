import 'package:cinema_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// configuración de go_ router
final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      name: HomePage.name,
      path: '/home/:page',
      builder: (context, state) {
        //obtner el inidice de la pagina del state
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return  HomePage(pageIndex: pageIndex,);
      },
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
