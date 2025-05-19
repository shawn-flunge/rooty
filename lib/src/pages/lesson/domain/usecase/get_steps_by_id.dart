


import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/lesson/data/resository/step.dart';
import 'package:rooty/src/pages/lesson/domain/repository/step_repository.dart';

// part 'get_steps_by_id.g.dart';
//
// @riverpod
// class GetStepsById extends _$GetStepsById {
//
//   @override
//   Future<dynamic> build(int lessonId) async{
//     // final repository = ref.read(stepRepositoryProvider);
//     return repository.getSteps(lessonId);
//   }
// }

class GetStepsById extends UseCase<dynamic, int> {

  final StepRepository repository;

  GetStepsById(this.repository);

  @override
  Future call(int param) async{
    return repository.getSteps(param);
  }

}