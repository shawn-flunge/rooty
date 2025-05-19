

import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/pages/lesson/presentation/provider/provider.dart';


class LessonSplash extends ConsumerStatefulWidget {
  final String lessonId;
  final dynamic splashData;

  const LessonSplash({super.key, required this.lessonId,  this.splashData,});

  @override
  ConsumerState<LessonSplash> createState() => _LessonSplashState();
}

class _LessonSplashState extends ConsumerState<LessonSplash> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          RTAppBarPlain(backgroundColor: Colors.transparent,),
          Text(
            'sdfsdf'
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              ref.read(lessonPageStateNotifierProvider(widget.lessonId).notifier).startLesson();
            },
            child: Container(
              color: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Text(
                  'fff'
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

