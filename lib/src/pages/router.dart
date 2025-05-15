


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/pages/auth/login/page.dart';
import 'package:rooty/src/pages/course/page.dart';
import 'package:rooty/src/pages/lesson/page.dart';
import 'package:rooty/src/pages/main/courses/page.dart';
import 'package:rooty/src/pages/main/home/page.dart';
import 'package:rooty/src/pages/main/main_scaffold.dart';
import 'package:rooty/src/pages/main/setting/page.dart';
import 'package:rooty/src/pages/router.enum.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();


final rootyRouter = GoRouter(
  initialLocation: Routes.home.path,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (c, s) => const ErrorPage(),
  routes: [

    StatefulShellRoute.indexedStack(
      builder: (c, s, shell) {
        return RootyMainScaffold(shell: shell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: Routes.home.path,
                name: Routes.home.name,
                builder: (c, s) => const HomePage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: Routes.login.path,
                    name: Routes.login.name,
                    builder: (c, s) => const LoginPage()
                  )
                ]
            ),
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: Routes.courses.path,
                name: Routes.courses.name,
                builder: (c, s) => const CoursesPage(),
                routes: [
                  GoRoute(
                      path: Routes.course.path,
                      name: Routes.course.name,
                      builder: (c, s) => const CoursePage(),
                      routes: [
                        GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            path: Routes.lesson.path,
                            name: Routes.lesson.name,
                            builder: (c, s) => const LessonPage()
                        )
                      ]
                  )
                ]
            ),
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: Routes.setting.path,
                name: Routes.setting.name,
                builder: (c, s) => const SettingPage()
            ),
          ]
        ),


      ]
    ),
  ]
);


class Abc extends GoRoute {

  final Routes route;

  // Abc({required this.route}) : super(path: route.path, name: route.name) {
  //   path = 'a';
  // }

  Abc({required this.route}) : super(path: route.path);

}