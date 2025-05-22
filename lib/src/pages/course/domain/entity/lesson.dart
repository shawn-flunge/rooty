
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
abstract class LessonEntity with _$LessonEntity {

  const factory LessonEntity({
    required int id,
    @JsonKey(name: 'course_id') required int courseId,
    required int order,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    required String title,
    required String description,
    @JsonKey(name: 'splash_meta') required Map<String, dynamic> splashMeta,
    @JsonKey(name: 'is_published') required bool isPublished
  }) = _LessonEntity;


  factory LessonEntity.fromJson(Map<String, dynamic> json) => _$LessonEntityFromJson(json);
}