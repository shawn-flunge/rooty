
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rooty/src/pages/lesson/data/resository/step.dart';
import 'package:rooty/src/pages/lesson/presentation/provider/state/page_state.dart';

part 'provider.g.dart';

@riverpod
class LessonPageStateNotifier extends _$LessonPageStateNotifier {

  @override
  Future<LessonPageState> build(String lessonId) async{
    final steps = await StepRepositoryImpl().getSteps(int.parse(lessonId));

    return LessonPageState(steps: steps);
  }

  void startLesson() {
    state = AsyncData(state.value!.copyWith(currentStep: 0));
  }

  void finishLesson() {
    print('finish');
  }

}