

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rooty/src/pages/lesson/domain/entity/step.dart';

part 'page_state.freezed.dart';

enum StepsState {
  loading,
  loaded,
  failed
}

@freezed
abstract class LessonPageState with _$LessonPageState{

  const factory LessonPageState({
    @Default(-1) int currentStep,
    @Default(StepsState.loading) StepsState stepsState,
    @Default([]) List<StepEntity> steps,
    @Default({}) Map<String, dynamic> bundle
  }) = _LessonPageState;

}