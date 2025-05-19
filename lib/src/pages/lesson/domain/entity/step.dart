

import 'package:freezed_annotation/freezed_annotation.dart';


part 'step.freezed.dart';
part 'step.g.dart';

@freezed
abstract class StepEntity with _$StepEntity {

  const factory StepEntity({
    required int order,
    @JsonKey(fromJson: StepContentType.fromJson) required StepContentType type,
    required Map<String, dynamic> content,
    @JsonKey(name: 'is_required') required bool isRequired
  }) = _StepEntity;


  factory StepEntity.fromJson(Map<String, dynamic> json) => _$StepEntityFromJson(json);
}


enum StepContentType {
  contentExplanation,
  unitOverview,
  unitExpansion,
  quizChoiceMultiple,
  quizChoiceSingle,
  quizMatching,
  summary;

  static StepContentType fromJson(String value) {
    // print('🚀 $json');

    switch(value) {
      case 'content_explanation' :
        return StepContentType.contentExplanation;
      case 'unit_overview' :
        return StepContentType.unitOverview;
      case 'unit_expansion' :
        return StepContentType.unitExpansion;
      case 'quiz_choice_multiple' :
        return StepContentType.quizChoiceMultiple;
      case 'quiz_choice_single' :
        return StepContentType.quizChoiceSingle;
      case 'quiz_matching' :
        return StepContentType.quizMatching;
      case 'summary' :
        return StepContentType.summary;
      default:
        return StepContentType.contentExplanation;
    }
  }
}


// class StepDto extends StepEntity{
//
// }