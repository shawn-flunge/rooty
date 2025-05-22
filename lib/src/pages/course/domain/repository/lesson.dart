

import 'package:rooty/src/pages/course/domain/entity/lesson.dart';

abstract class LessonRepository {

  Future< List<LessonEntity> > getLessons(int courseId);
}