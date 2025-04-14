
import 'package:flutter/material.dart';
import 'package:design_system/widget.dart' show RTCalendar;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
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
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(255),
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


                return Container(
                  height: 144,
                  width: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(255),
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
                );
              }),
            ),
          ),
        ),

      ],
    );
  }

}

