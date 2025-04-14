


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/pages/auth/login/page.dart';
import 'package:rooty/src/pages/main/courses/page.dart';
import 'package:rooty/src/pages/main/home/page.dart';
import 'package:rooty/src/pages/main/main_scaffold.dart';
import 'package:rooty/src/pages/main/setting/page.dart';
import 'package:rooty/src/pages/router.enum.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();


final rootyRouter = GoRouter(
  initialLocation: RootyRoutes.home.path,
  navigatorKey: _rootNavigatorKey,
  routes: [

    StatefulShellRoute.indexedStack(
      builder: (c, s, shell) {
        return RootyMainScaffold(shell: shell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: RootyRoutes.home.path,
                name: RootyRoutes.home.name,
                builder: (c, s) => const HomePage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: RootyRoutes.login.path,
                    name: RootyRoutes.login.name,
                    builder: (c, s) => const LoginPage()
                  )
                ]
            ),
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: RootyRoutes.courses.path,
                name: RootyRoutes.courses.name,
                builder: (c, s) => const CoursesPage()
            ),
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: RootyRoutes.setting.path,
                name: RootyRoutes.setting.name,
                builder: (c, s) => const SettingPage()
            ),
          ]
        ),


      ]
    ),
  ]
);


class Abc extends GoRoute {
  Abc({required super.path});

}