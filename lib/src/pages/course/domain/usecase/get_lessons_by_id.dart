


import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/course/domain/entity/lesson.dart';
import 'package:rooty/src/pages/course/domain/repository/lesson.dart';

class GetLessonsByCourseId extends UseCase< List<LessonEntity>, int> {

  final LessonRepository repository;
  GetLessonsByCourseId(this.repository);

  @override
  Future<List<LessonEntity>> call(int param) async{
    final lessons = await repository.getLessons(param);
    lessons.sort((a, b) => a.order - b.order);
    return lessons;
  }
}