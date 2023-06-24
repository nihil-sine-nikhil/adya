import 'package:fluro/fluro.dart';

import '../../presentation/no_routes_found/no_routes_found_screen.dart';
import '../../presentation/splash/splash_screen.dart';

mixin AppRoutes {
  static final splashRoute = AppRoute(
    '/',
    Handler(
      handlerFunc: (context, parameters) => const SplashScreen(),
    ),
  );

  // Not Found Route
  static final routeNotFoundHandler = Handler(
    handlerFunc: (context, params) => const RouteNotFoundScreen(),
  );

  /// Primitive function to get one param detail route (i.e. id).
  static String getRoute(String route, Map<String, String> slugParameters) {
    String newRoute = route;
    slugParameters.forEach(
      (key, value) {
        newRoute = newRoute.replaceAll(':$key', value);
      },
    );
    return newRoute;
  }

  // Routes
  static final List<AppRoute> routes = [
    splashRoute,
  ];
}
