
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/pages/lesson/presentation/page/splash.dart';
import 'package:rooty/src/pages/lesson/presentation/page/step_list.dart';
import 'package:rooty/src/pages/lesson/presentation/provider/provider.dart';


class LessonPage extends StatelessWidget {
  final String lessonId;
  final String courseId;
  final Map<String, dynamic> splashMeta;

  const LessonPage({
    super.key,
    required this.splashMeta,
    required this.lessonId,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      child: Consumer(
          child: LessonSplash(lessonId: lessonId, courseId: courseId, splashData: splashMeta,),
          builder: (c, ref, splash) {

            final state = ref.watch(lessonPageStateNotifierProvider(lessonId, courseId));

            return (state.isLoading || state.value!.currentStep == -1)
                ? splash!
                : LessonStepListPage(steps: state.value!.steps, bundle: state.value!.bundle,);
          }
      ),
    );
  }
}


class LessonPageBottomSheet extends StatefulWidget {
  const LessonPageBottomSheet({super.key});

  @override
  State<LessonPageBottomSheet> createState() => _LessonPageBottomSheetState();
}


class _LessonPageBottomSheetState extends State<LessonPageBottomSheet> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {

    return Positioned(
      bottom: 0,
      left: 0, right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 8,
              spreadRadius: 4
            )
          ]
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: GestureDetector(
                onTap: () {
                  if(_controller.isCompleted) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: Row(
                  children: [
                    Container(
                      width: 40, height: 40, color: Colors.red,
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Container(
                        height: 40, color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizeTransition(
              sizeFactor: _controller,
              axisAlignment: 1,
              child: Container(
                height: MediaQuery.of(context).size.height*0.6,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'contents'
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
