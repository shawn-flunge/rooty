

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/pages/router.enum.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Courses'
          ),

          const SizedBox(height: 32,),

          GestureDetector(
            onTap: () {
              context.goNamed(Routes.course.name);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              child: Row(
                children: [
                  Container(
                    width: 80, height: 80,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 24,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '천자문',
                        style: TextStyle(
                            fontSize: 24
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Container(
                        width: 160,
                        height: 16,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.red,
                              width: 70,
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
