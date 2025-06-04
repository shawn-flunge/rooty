



import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rooty/src/pages/course/data/repository.dart';
import 'package:rooty/src/pages/course/domain/usecase/get_lessons_by_id.dart';
import 'package:rooty/src/pages/course/domain/usecase/get_progress.dart';
import 'package:rooty/src/pages/course/presentation/provider/state.dart';

part 'provider.g.dart';

@riverpod
class CoursePageStateNotifier extends _$CoursePageStateNotifier {

  @override
  Future<CoursePageState> build(String courseId) async{

    final repository = LessonRepositoryImpl();

    final lessonsById = GetLessonsByCourseId( repository );
    final lessons = await lessonsById(int.parse(courseId));


    final getProgress = GetProgress(repository);
    final progress = await getProgress(int.parse(courseId));

    return CoursePageState(
      lessons: lessons,
      progress: progress
    );
  }


  /// lessonId는 1부터 시작
  /// progress는 0부터 시작
  void updateProgress(int lessonId) {
    // final lastLesson = state.value!.progress + 1;
    final progress = state.value!.progress + 1;

    if(lessonId <= progress) {
      return;
    } else {
      state = AsyncData(
          state.value!.copyWith(progress: max(state.value!.progress, progress))
      );
    }
  }
}