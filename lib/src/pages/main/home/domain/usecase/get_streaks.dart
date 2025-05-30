



import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/main/home/domain/repository/repository.dart';

class GetStreaks extends UseCase< List<DateTime>, NoParam> {

  final HomePageRepository repository;
  GetStreaks(this.repository);

  @override
  Future<List<DateTime>> call(NoParam param) async{
    return repository.getStreak();
  }

}