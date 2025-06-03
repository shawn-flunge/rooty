

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rooty/src/pages/course/domain/entity/lesson.dart';

part 'state.freezed.dart';

@freezed
abstract class CoursePageState with _$CoursePageState {

  const factory CoursePageState({
    @Default([]) List<LessonEntity> lessons,
    @Default(0) int progress
  }) = _CoursePageState;

}