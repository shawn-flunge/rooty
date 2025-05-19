
import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/lesson/domain/repository/step_repository.dart';


class GetStepsById extends UseCase<dynamic, int> {

  final StepRepository repository;

  GetStepsById(this.repository);

  @override
  Future call(int param) async{
    return repository.getSteps(param);
  }

}