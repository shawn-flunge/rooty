



import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rooty/src/pages/course/data/repository.dart';
import 'package:rooty/src/pages/course/domain/usecase/get_lessons_by_id.dart';
import 'package:rooty/src/pages/course/presentation/provider/state.dart';

part 'provider.g.dart';

@riverpod
class CoursePageStateNotifier extends _$CoursePageStateNotifier {

  @override
  Future<CoursePageState> build(String courseId) async{

    final lessonsById = GetLessonsByCourseId( LessonRepositoryImpl() );
    final lessons = await lessonsById(int.parse(courseId));

    /// todo: 진행도
    return CoursePageState(
      lessons: lessons
    );
  }

}