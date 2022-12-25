import 'package:flutter_animations/src/animations/animations.dart';
import 'package:flutter_animations/src/home/home.dart';
import 'package:go_router/go_router.dart';

import 'constants.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: home,
      builder: (context, state) => HomeScreen(key: state.pageKey),
      routes: <RouteBase>[
        GoRoute(
          path: 'mouse-courser',
          name: mouseCourser,
          builder: (context, state) =>
              MouseCourserAnimation(key: state.pageKey),
        ),
        GoRoute(
          path: 'flip-animation',
          name: flipAnimation,
          builder: (context, state) => FlipAnimation(key: state.pageKey),
        ),
      ],
    ),
  ],
);
