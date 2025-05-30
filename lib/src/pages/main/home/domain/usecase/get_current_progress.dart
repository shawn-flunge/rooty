



import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/main/home/domain/repository/repository.dart';

class GetCurrentProgress extends UseCase< int, int > {

  final HomePageRepository repository;
  GetCurrentProgress(this.repository);

  @override
  Future<int> call(int param) {
    return repository.getCurrentProgress(param);
  }
}