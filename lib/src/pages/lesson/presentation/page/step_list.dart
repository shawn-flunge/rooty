
import 'package:design_system/color.dart';
import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/localizations/texts.dart';
import 'package:rooty/src/localizations/widget.dart';
import 'package:rooty/src/pages/lesson/domain/entity/step.dart';
import 'package:rooty/src/pages/lesson/presentation/provider/provider.dart';
import 'package:rooty/src/pages/lesson/presentation/widget/step_view.dart';

class LessonStepListPage extends ConsumerStatefulWidget {

  final List<StepEntity> steps;
  final Map<String, dynamic> bundle;

  const LessonStepListPage({
    super.key,
    required this.steps,
    required this.bundle
  });

  @override
  ConsumerState<LessonStepListPage> createState() => _LessonStepListPageState();
}

class _LessonStepListPageState extends ConsumerState<LessonStepListPage> {

  late final List<StepEntity> _progress;
  late final PageController _controller;


  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _progress = widget.steps.sublist(0, 1).map((e) => e.copyWith()).toList();
  }


  _goToNextStep(int index) {

    if(index == widget.steps.length-1) {
      final lessonId = GoRouter.of(context).state.pathParameters['lessonId']!;
      /// todo: ㅇㅇ
      final courseId = '1';

      ref.read(lessonPageStateNotifierProvider(lessonId, courseId).notifier).finishLesson();
      context.pop<bool>(true);
    } else {

      if(index == _progress.length-1) {

        _completeCurrentStep(index);
      } else {
        _animateTo();
      }
    }
  }

  _completeCurrentStep(int current) {
    setState(() {
      _progress.add(
          widget.steps.elementAt(current+1).copyWith()
      );
    });
    _animateTo();
  }

  _animateTo() => _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: RTAppBarPlain(
        onClosed: () async{
          final wannaGoBack = await showConfirmDialog(context) ?? false;

          return wannaGoBack;
        },
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: _progress.length,
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final step = _progress[index];

          return StepView(
            type: step.type,
            content: step.content,
            bundle: widget.bundle,
            onPassedStep: () {

              _goToNextStep(index);
            },
          );
        }
    ),
      // body: LayoutBuilder(
      //   builder: (context, constraints) {
      //
      //     return PageView.builder(
      //         controller: _controller,
      //         itemCount: _progress.length,
      //         physics: const PageScrollPhysics(),
      //         scrollDirection: Axis.vertical,
      //         itemBuilder: (context, index) {
      //           final step = _progress[index];
      //
      //           return StepView(
      //             type: step.type,
      //             content: step.content,
      //             onPassedStep: () {
      //               _goToNextStep(index);
      //             },
      //           );
      //         }
      //     );
      //
      //   },
      // ),
    );
  }


  /// todo: 공통화
  Future<bool?> showConfirmDialog<T>(BuildContext context) async{

    return showDialog<bool?>(
        context: context,
        builder: (c) {
          return AlertDialog(
            backgroundColor: context.colors.modalBackground,
            actionsAlignment: MainAxisAlignment.center,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LocalizedText(
                  'lesson_exit_modal_title',
                  style: TextStyle(
                      fontSize: 24,
                      color: context.colors.text,
                      fontVariations: [
                        FontVariation.weight(400)
                      ]
                  ),
                ),
                const SizedBox(height: 8,),
                LocalizedText(
                  'lesson_exit_modal_description',
                  style: TextStyle(
                      fontSize: 18,
                      color: context.colors.text,
                      fontVariations: [
                        FontVariation.weight(320)
                      ]
                  ),
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: RTConfirmButton.small(
                        text: RootyTexts.of(context).get('lesson_exit_modal_continue')?.text ?? '',
                        onPressed: () {
                          context.pop(false);
                        },
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: RTConfirmButton.small(
                        text: RootyTexts.of(context).get('exit')?.text ?? '',
                        textColor: context.colors.text,
                        backgroundColor: context.colors.lightGrey,
                        onPressed: () {
                          context.pop(true);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
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

