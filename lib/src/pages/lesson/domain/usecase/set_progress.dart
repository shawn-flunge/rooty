
import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/lesson/domain/repository/lesson.dart';

typedef SetProgressParam = ({String courseId, int progress});

class SetProgress extends UseCase<bool, SetProgressParam> {
  
  final LessonPageRepository repository;

  SetProgress(this.repository);


  @override
  Future<bool> call(SetProgressParam param) async{
    final isFirst = await repository.setProgress(courseId: param.courseId, progress: param.progress);

    return isFirst;
  }
}