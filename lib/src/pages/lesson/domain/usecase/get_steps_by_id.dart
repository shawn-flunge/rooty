
import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/lesson/domain/entity/step.dart';
import 'package:rooty/src/pages/lesson/domain/repository/step_repository.dart';


class GetStepsById extends UseCase<List<StepEntity>, int> {

  final StepRepository repository;

  GetStepsById(this.repository);

  @override
  Future< List<StepEntity> > call(int param) async{
    return repository.getSteps(param);
  }

}