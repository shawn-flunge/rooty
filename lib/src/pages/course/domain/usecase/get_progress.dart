


import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/course/domain/repository/lesson.dart';

class GetProgress extends UseCase<int, int> {

  final LessonRepository repository;
  GetProgress(this.repository);

  @override
  Future<int> call(int param) {
    return repository.getProgress(courseId: param);
  }
}