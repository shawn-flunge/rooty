

import 'package:rooty/src/pages/lesson/domain/entity/step.dart';

abstract class StepRepository {

  Future< List<StepEntity> > getSteps(int lessonId);
}
