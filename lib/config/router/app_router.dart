import 'package:cinema_app/presentation/screens/screens.dart';
import 'package:cinema_app/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

// configuración de go_ router
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

 ShellRoute(
  builder: (context, state, child) {
    return HomePage(childView: child,);
  },
  routes: [
    GoRoute(path: '/',
    builder: (context, state) {
      return const HomeView();
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
    GoRoute(path: '/favorites',
    builder: (context, state) {
      return const FavoritesView();
    },
    ),
  ]
 )


//rutas padre-hijo
   /* GoRoute(
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
    ),*/
    
  ],
);
