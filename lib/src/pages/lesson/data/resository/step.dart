


import 'package:data_source/data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/pages/lesson/domain/entity/step.dart';
import 'package:rooty/src/pages/lesson/domain/repository/step_repository.dart';

// final stepRepositoryProvider = Provider.autoDispose<StepRepository>((ref) {
//   return StepRepositoryImpl();
// });

class StepRepositoryImpl extends StepRepository {

  late final EducationDataSource _source;

  StepRepositoryImpl() {
    _source = EducationDataSource();
  }

  @override
  Future< List<StepEntity> > getSteps(int lessonId) async{

    final steps = await _source.getStepsByLessonId(lessonId);

    final entities = steps.map((e) => StepEntity.fromJson(e)).toList();
    entities.sort((a, b) => a.order - b.order);

    return entities;
  }
}