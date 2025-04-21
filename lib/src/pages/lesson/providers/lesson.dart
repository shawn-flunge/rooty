

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rooty/src/domains/education/lesson/entity.dart';
import 'package:rooty/src/domains/education/lesson/usecases/by_id.dart';
import 'package:rooty/src/domains/education/repository.dart';

part 'lesson.g.dart';

@riverpod
class LessonById extends _$LessonById {


  @override
  Future<Lesson> build(String id) {
    final repo = ref.read(educationRepositoryProvider);
    final usecase = GetLessonById(repo);
    return usecase(id);
  }

}