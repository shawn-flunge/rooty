

import 'package:data_source/data_source.dart';
import 'package:rooty/src/pages/lesson/domain/repository/lesson.dart';

class LessonPageRepositoryImpl extends LessonPageRepository {
  late final UserLocalDataSource _localDataSource;
  LessonPageRepositoryImpl() {
    _localDataSource = UserLocalDataSource();
  }

  @override
  Future<bool> setProgress({required String courseId, required int progress}) {
    return _localDataSource.setProgress(progress: progress, courseId: courseId);
  }
}