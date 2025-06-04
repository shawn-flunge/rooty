
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rooty/src/pages/course/presentation/provider/provider.dart';
import 'package:rooty/src/pages/lesson/data/resository/lesson.dart';
import 'package:rooty/src/pages/lesson/data/resository/localized_bundle.dart';
import 'package:rooty/src/pages/lesson/data/resository/step.dart';
import 'package:rooty/src/pages/lesson/domain/usecase/get_localized_bundle_by_id.dart';
import 'package:rooty/src/pages/lesson/domain/usecase/get_steps_by_id.dart';
import 'package:rooty/src/pages/lesson/domain/usecase/set_progress.dart';
import 'package:rooty/src/pages/lesson/presentation/provider/state/page_state.dart';
import 'package:rooty/src/pages/main/home/presentation/provider/provider.dart';

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
    final id = int.parse(lessonId);
    ref.read(homePageStateNotifierProvider.notifier).updateProgress(id);

    /// todo: 코스 여러개 생기면 하드코딩 박은거 처리해야함
    ref.read(coursePageStateNotifierProvider('1').notifier).updateProgress(id);

    final setProgress = SetProgress( LessonPageRepositoryImpl() );

    /// todo: 첫 레슨이면 어떤 이벤트를 팡팡
    final isFirst = setProgress((courseId: courseId, progress: id-1));
  }

}