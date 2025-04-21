

import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/domains/education/lesson/entity.dart';
import 'package:rooty/src/domains/education/repository.dart';

class GetLessonById extends UseCase<Lesson, String> {

  final EducationRepository repository;
  GetLessonById(this.repository);

  @override
  Future<Lesson> call(String param) async{
    return repository.getLessonById(param);
  }
}