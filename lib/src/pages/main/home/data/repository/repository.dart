

import 'package:data_source/data_source.dart';
import 'package:rooty/src/pages/main/home/domain/repository/repository.dart';

class HomePageRepositoryImpl extends HomePageRepository {

  late final UserLocalDataSource _userLocalDataSource;


  HomePageRepositoryImpl() {
    _userLocalDataSource = UserLocalDataSource();
  }


  @override
  Future< List<DateTime> > getStreak() async{
    final list = await _userLocalDataSource.getStreak();

    return list.map((e) => DateTime.parse(e)).toList();
  }

  @override
  Future<int> getCurrentProgress(int courseId) async{
    final progress = await _userLocalDataSource.getCurrentProgress(courseId: courseId);
    return progress;
  }

}