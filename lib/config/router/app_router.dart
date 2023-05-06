import 'package:cinema_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';


// configuración de go_ router
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomePage.name,
      path: '/',
      builder: (context, state) =>  const HomePage(),
    ),
  ],
);
