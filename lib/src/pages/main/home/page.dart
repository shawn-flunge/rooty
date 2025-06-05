
import 'package:design_system/layout.dart';
import 'package:design_system/widget.dart' show RTCalendar, RTCircularIndicator;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/pages/main/home/presentation/provider/provider.dart';
import 'package:rooty/src/pages/main/home/presentation/widget/ongoing_course.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(homePageStateNotifierProvider);

    return state.isLoading
      ? Center( child: RTCircularIndicator(),)
      : DefaultLayout(
        children: [
          const SizedBox(height: 32,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: RTCalendar(
              streaks: state.value!.streaks,
            ),
          ),
          const SizedBox(height: 24,),

          OngoingCourse(
            progress: state.value!.progress,
          ),

        ],
      );
  }
}
