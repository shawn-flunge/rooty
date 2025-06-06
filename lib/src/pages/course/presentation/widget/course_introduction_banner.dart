
import 'package:design_system/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:rooty/src/localizations/widget.dart';

class CourseIntroductionBanner extends StatelessWidget{

  final int lessonNumber;
  final void Function()? onButtonTapped;

  const CourseIntroductionBanner({
    super.key,
    required this.lessonNumber,
    this.onButtonTapped
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      // color: Colors.grey,
      child: Column(
        children: [
          // const Placeholder(),
          LocalizedText(
            'course_1000',
            style: TextStyle(
              fontSize: 24,
              color: context.colors.text,
              fontVariations: [
                FontVariation.weight(500)
              ]
            ),
          ),
          const SizedBox(height: 8,),
          LocalizedText(
            'course_1000_description',
            style: TextStyle(
                fontSize: 16,
                color: context.colors.text2,
                fontVariations: [
                  FontVariation.weight(350)
                ]
            ),
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.book_check,
                size: 20,
                color: context.colors.black,
              ),
              const SizedBox(width: 8,),
              LocalizedText(
                '$lessonNumber Lessons',
                style: TextStyle(
                    fontSize: 16,
                    color: context.colors.text,
                    fontVariations: [
                      FontVariation.weight(360)
                    ]
                ),
              ),

              const SizedBox(width: 24,),

              Icon(
                LucideIcons.hourglass,
                size: 20,
                color: context.colors.black,
              ),
              const SizedBox(width: 8,),
              LocalizedText(
                'minutes',
                args: {'number': '5'},
                style: TextStyle(
                    fontSize: 16,
                    color: context.colors.text,
                    fontVariations: [
                      FontVariation.weight(360)
                    ]
                ),
              ),

            ],
          ),
          // const SizedBox(height: 8,),
          // RTConfirmButton.medium(
          //   text: '최근 레슨으로 이동',
          //   backgroundColor: Color(0xFF2D4C7C),
          //   textColor: Colors.white,
          //   onPressed: onButtonTapped
          // )

        ],
      ),
    );
  }
  
}
