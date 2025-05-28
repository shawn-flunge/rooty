
import 'package:design_system/layout.dart';
import 'package:flutter/material.dart';
import 'package:design_system/widget.dart' show RTCalendar;
import 'package:go_router/go_router.dart';
import 'package:rooty/src/pages/router.enum.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultLayout(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            'Hello\nSomeone!',
            style: TextStyle(
                fontSize: 32
            ),
          ),
        ),
        RTCalendar(),

        const SizedBox(height: 24,),
        /// 누르면 애니메이션??
        Text(
          '유저가 입력하는 목표, 동기부여 문구',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 24,),

        Row(
          children: [
            Expanded(
                child: Container(
                  height: 100,
                  color: Colors.grey,
                  child: Text(
                      '셀프 체크 영역'
                  ),
                )
            ),
            const SizedBox(width: 24,),
            Expanded(
                child: Container(
                  height: 100,
                  color: Colors.grey,
                  child: Text(
                      '진행률 영역'
                  ),
                )
            ),
          ],
        ),
        const SizedBox(height: 24,),

        // Text(
        //     '이주의 단어'
        // ),
        // Container(
        //   width: double.infinity,
        //   height: 100,
        //   color: Colors.grey,
        // ),
        // const SizedBox(height: 32,),


        OnGoing(),

        // const SizedBox(height: 32,),
        // Text(
        //   '읽고있는 고전'
        // ),
        // Container(
        //   width: double.infinity,
        //   height: 400,
        //   color: Colors.grey,
        // ),


      ],
    );
  }
}

class OnGoing extends StatelessWidget {
  const OnGoing({super.key});

  @override
  Widget build(BuildContext context) {

    final list = [1,2,3];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            '최근 학습'
        ),
        Container(
          width: double.infinity,
          // height: 300,
          color: Colors.grey,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Row(
              children: List.generate(list.length + 1, (i) {

                if(i == list.length) {
                  return Container(
                    height: 144,
                    width: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(25),
                              spreadRadius: 1,
                              blurRadius: 4
                          )
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add
                        ),
                        Text(
                          '만들기'
                        ),
                      ],
                    ),
                  );
                }


                return GestureDetector(
                  onTap: () {
                    /// todo: courseId
                    context.goNamed(Routes.course.name, pathParameters: {'courseId': '1'});
                  },
                  child: Container(
                    height: 144,
                    width: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(25),
                              spreadRadius: 1,
                              blurRadius: 4
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '한국어'
                        ),
                        Text(
                            '6급'
                        ),
                        const Spacer(),
                        // const SizedBox(height: 48,),
                        Row(
                          children: [
                            Text(
                                '30%'
                            ),
                            Container(
                              width: 50,
                              height: 10,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),

      ],
    );
  }

}

