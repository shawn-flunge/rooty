


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/pages/auth/login/page.dart';
import 'package:rooty/src/pages/course/page.dart';
import 'package:rooty/src/pages/error/page.dart';
import 'package:rooty/src/pages/lesson/page.dart';
import 'package:rooty/src/pages/main/courses/page.dart';
import 'package:rooty/src/pages/main/home/page.dart';
import 'package:rooty/src/pages/main/main_scaffold.dart';
import 'package:rooty/src/pages/main/setting/page.dart';
import 'package:rooty/src/pages/main/setting/page/theme.dart';
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


        /// 천자문 하나라서 일단 바로 천자문으로 이동
        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //         path: Routes.courses.path,
        //         name: Routes.courses.name,
        //         builder: (c, s) => const CoursesPage(),
        //         routes: [
        //           GoRoute(
        //               path: '/:courseId',
        //               name: Routes.course.name,
        //               redirect: (c, s) async {
        //                 final course = s.pathParameters['courseId'];
        //                 if(course == null) return 'error';
        //
        //                 return null;
        //               },
        //               builder: (c, s) {
        //                 final courseId = s.pathParameters['courseId']!;
        //
        //                 return CoursePage(
        //                   courseId: courseId,
        //                 );
        //               },
        //               routes: [
        //                 GoRoute(
        //                     parentNavigatorKey: _rootNavigatorKey,
        //                     path: '/:lessonId',
        //                     name: Routes.lesson.name,
        //                     redirect: (c, s) async {
        //                       final lesson = s.pathParameters['lessonId'];
        //                       if(lesson == null) return 'error';
        //
        //                       return null;
        //                     },
        //                     builder: (c, s) {
        //                       final lesson = s.pathParameters['lessonId']!;
        //                       final splash = s.extra as Map<String, dynamic>;
        //                       return LessonPage(
        //                         lessonId: lesson,
        //                         splashMeta: splash,
        //                       );
        //                     }
        //                 )
        //               ]
        //           )
        //         ]
        //     ),
        //   ]
        // ),

        StatefulShellBranch(
          routes: [
            GoRoute(
                // parentNavigatorKey: _rootNavigatorKey,
              path: Routes.courses.path,
              name: Routes.courses.name,
              builder: (c, s) {
                // final courseId = s.pathParameters['courseId']!;
                /// todo: ㅇㅇ
                final courseId = '1';

                return CoursePage(
                  courseId: courseId,
                );
              },
              routes: [
                GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: '/:lessonId',
                    name: Routes.lesson.name,
                    redirect: (c, s) async {
                      final lesson = s.pathParameters['lessonId'];
                      if(lesson == null) return 'error';

                      return null;
                    },
                    builder: (c, s) {
                      final lesson = s.pathParameters['lessonId']!;
                      final splash = s.extra as Map<String, dynamic>;
                      /// todo: ㅇㅇ
                      final courseId = '1';
                      return LessonPage(
                        lessonId: lesson,
                        courseId: '1',
                        splashMeta: splash,
                      );
                    }
                )
              ]
            )
          ]
        ),


        StatefulShellBranch(
          routes: [
            GoRoute(
                path: Routes.setting.path,
                name: Routes.setting.name,
                builder: (c, s) => const SettingPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: Routes.themeSetting.path,
                    name: Routes.themeSetting.name,
                    builder: (c, s) => const ThemeSettingPage()
                  )
                ]
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