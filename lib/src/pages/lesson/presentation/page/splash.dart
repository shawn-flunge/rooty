

import 'package:design_system/color.dart';
import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/core/find_value_from_l10n.dart';
import 'package:rooty/src/localizations/texts.dart';
import 'package:rooty/src/localizations/widget.dart';
import 'package:rooty/src/pages/lesson/presentation/provider/provider.dart';


class LessonSplash extends ConsumerStatefulWidget {
  final String lessonId;
  final String courseId;
  final Map<String, dynamic> splashData;

  const LessonSplash({super.key, required this.lessonId, required this.courseId, required this.splashData,});

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

  Map<String, dynamic> get meta => widget.splashData;
  String _localizedString(String key){
    return meta.findString(key);
  }

  Widget _padding({required Widget child, double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: vertical ?? 0),
      child: child,
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          RTAppBarPlain(backgroundColor: Colors.transparent,),
          const Spacer(),
          _padding(
            child: LocalizedText(
              _localizedString('splash_title'),
              style: TextStyle(
                fontSize: 40,
                color: context.colors.text,
                fontVariations: [
                  FontVariation.weight(400)
                ]
              ),
            )
          ),
          const SizedBox(height: 32,),
          _padding(
              child: LocalizedText(
                _localizedString('splash_description'),
                style: TextStyle(
                  fontSize: 20,
                  color: context.colors.text,
                  fontVariations: [
                    FontVariation.weight(300)
                  ]
                ),
              ),
          ),
          const SizedBox(height: 100,),
          _padding(
            vertical: 16,
              child: RTConfirmButton.big(
                text: RootyTexts.of(context).get('start')!.text,
                // backgroundColor: canPass ? Colors.green : Colors.grey,
                onPressed: () {
                  ref.read(lessonPageStateNotifierProvider(widget.lessonId, widget.courseId).notifier).startLesson();
                },
              ),
          ),
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

