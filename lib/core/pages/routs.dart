import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:perla_test/modules/home/Presentation/screens/home_screen.dart';

import '../../modules/authentication/Presentation/screens/login_screen.dart';
import '../../modules/authentication/Presentation/screens/register_screen.dart';
import '../storage/storage_handler.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      redirect: (BuildContext context, GoRouterState state) {
        print(StorageHandler().hasToken);
        print(StorageHandler().token);
        if (StorageHandler().hasToken) {
          return '/home';
        }
        return null;
      },
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
  ],
);
