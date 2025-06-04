
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rooty/src/pages/lesson/data/resository/localized_bundle.dart';
import 'package:rooty/src/pages/lesson/data/resository/step.dart';
import 'package:rooty/src/pages/lesson/domain/usecase/get_localized_bundle_by_id.dart';
import 'package:rooty/src/pages/lesson/domain/usecase/get_steps_by_id.dart';
import 'package:rooty/src/pages/lesson/presentation/provider/state/page_state.dart';

part 'provider.g.dart';

@riverpod
class LessonPageStateNotifier extends _$LessonPageStateNotifier {

  @override
  Future<LessonPageState> build(String lessonId, String courseId) async{
    final stepsById = GetStepsById(StepRepositoryImpl());
    final steps = await stepsById(int.parse(lessonId));

    final bundleById = GetLocalizedBundleById(LocalizedBundleRepositoryImpl());
    final bundle = await bundleById(int.parse(lessonId));

    return LessonPageState(
      steps: steps,
      bundle: bundle
    );
  }

  void startLesson() {
    if(state.hasValue) {
      state = AsyncData(state.value!.copyWith(currentStep: 0));
    }
  }

  void finishLesson() {
    print('finish');
  }

}