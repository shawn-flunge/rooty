

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/pages/router.enum.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Course'
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: (){
              context.goNamed(Routes.lesson.name);
            },
            child: Text(
                'f'
            ),
          )
        ],
      ),
    );
  }
}
