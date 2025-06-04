


import 'package:design_system/color.dart';
import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/localizations/texts.dart';
import 'package:rooty/src/localizations/widget.dart';
import 'package:rooty/src/pages/router.enum.dart';

class OngoingCourse extends StatefulWidget {
  final int progress;
  const OngoingCourse({
    super.key,
    required this.progress
  });

  @override
  State<OngoingCourse> createState() => _OngoingCourseState();
}

class _OngoingCourseState extends State<OngoingCourse> {

  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.82);
  }


  @override
  Widget build(BuildContext context) {
    // final progress = ref.read(homePageStateNotifierProvider);


    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: PageView.builder(
        controller: _controller,
        itemCount: 1,
        itemBuilder: (c, i) {
          return _Card(
            progress: widget.progress,
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}



class _Card extends StatelessWidget {
  final int progress;
  const _Card({
    super.key,
    required this.progress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF2D4C7C),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocalizedText(
            'course_1000',
            style: TextStyle(
                fontSize: Localizations.localeOf(context).languageCode == 'en'
                    ? 32
                    : 48,
                color: Colors.white,
                fontVariations: [
                  FontVariation.weight(770)
                ]
            ),
          ),


          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              LocalizedText(
                'course_1000_description',
                style: TextStyle(
                  fontSize: 24,
                  color: const Color(0xFFE3E3E3),
                  fontVariations: [
                    FontVariation.weight(600)
                  ],
                ),
              ),
              const SizedBox(width: 8,),
              LocalizedText(
                'minutes',
                args: {'number' : '5'},
                style: TextStyle(
                    fontSize: 16,
                    color: context.colors.lightGrey,
                    fontVariations: [
                      FontVariation.weight(400)
                    ]
                ),
              )
            ],
          ),

          const Spacer(),



          if(progress != -1)
            LocalizedText(
              'lesson',
              args: {'lesson' : '${progress+2}'},
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontVariations: [
                  FontVariation.weight(600)
                ]
              ),
            ),
          const SizedBox(height: 8,),
          RTConfirmButton.medium(
            text: RootyTexts.of(context).get('start')!.text,
            textColor: const Color(0xFF2D4C7C),
            backgroundColor: Colors.white,
            onPressed: () {
              // context.goNamed(Routes.course.name, pathParameters: {'courseId': '1'});
              context.goNamed(Routes.courses.name);
            },
          )
        ],
      ),
    );
  }
}