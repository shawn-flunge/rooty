


import 'package:data_source/data_source.dart';
import 'package:rooty/src/pages/course/domain/entity/lesson.dart';
import 'package:rooty/src/pages/course/domain/repository/lesson.dart';

class LessonRepositoryImpl extends LessonRepository {

  late final EducationDataSource _source;

  LessonRepositoryImpl() {
    _source = EducationDataSource();
  }

  @override
  Future< List<LessonEntity> > getLessons(int courseId) async{

    final lessons = await _source.getLessons(courseId);

    return lessons.map((e) => LessonEntity.fromJson(e)).toList();
  }

}