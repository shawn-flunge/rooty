

import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/localizations/texts.dart';
import 'package:rooty/src/pages/course/presentation/provider/provider.dart';
import 'package:rooty/src/pages/course/presentation/widget/course_introduction_banner.dart';
import 'package:rooty/src/pages/course/presentation/widget/lesson_button.dart';



class CoursePage extends ConsumerStatefulWidget {
  final String courseId;

  const CoursePage({
    super.key,
    required this.courseId
  });

  @override
  ConsumerState<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends ConsumerState<CoursePage> {


  late final ScrollController _controller;


  @override
  void initState() {
    super.initState();
    /// 진행 중인 레슨이 있으면 거기를 initialScrollOffset으로
    _controller = ScrollController();
  }

  Future<void> _goTo(int index) async{
    final double to = (132.0 * (index+1) - _controller.position.viewportDimension/2)
        .clamp(0, _controller.position.maxScrollExtent);

    await _controller.animateTo(
        to,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final state = ref.watch(coursePageStateNotifierProvider(widget.courseId));

    ref.listen(coursePageStateNotifierProvider(widget.courseId), (previous, state) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _goTo(state.value!.progress+2);
      });
    });

    if(state.isLoading) return Center(child: CircularProgressIndicator(),);

    final lessons = state.value!.lessons;

    return ListView.builder(
        controller: _controller,
        itemCount: lessons.length + 2,
        itemBuilder: (c2, i) {
          if(i == 0) {
            return CourseIntroductionBanner(
              lessonNumber: lessons.length,
              onButtonTapped: () {
                _goTo(4);
              },
            );
          }
          if(i == lessons.length+1) {
            return SizedBox(
              height: 264,
              child: lessons.length >= 250
                  ? null
                  : Center(child: Text('to be continued'),),
            );
          }

          final realIndex = i-1;
          final lesson = lessons[realIndex];
          final d = i % 2 == 0 ? 1 : -1;

          return LessonButton(
            lesson: lesson,
            progress: state.value!.progress,
            isDone: realIndex <= state.value!.progress,
            direction: d,
            onTap: () async => _goTo(i),
            onLessonFinished: () {
              ref.read(coursePageStateNotifierProvider(widget.courseId).notifier).finishLesson();
            },
          );
        }
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

