

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/pages/main/home/data/repository/repository.dart';
import 'package:rooty/src/pages/main/home/domain/usecase/get_current_progress.dart';
import 'package:rooty/src/pages/main/home/domain/usecase/get_streaks.dart';
import 'package:rooty/src/pages/main/home/presentation/provider/state.dart';

part 'provider.g.dart';

@riverpod
class HomePageStateNotifier extends _$HomePageStateNotifier {

  @override
  Future<HomePageState> build() async{
    final repository = HomePageRepositoryImpl();


    final getStreaks = GetStreaks( repository );
    final streaks = await getStreaks(NoParam());
    
    final getProgress = GetCurrentProgress(repository);
    final progress = await getProgress(1);



    return HomePageState(
      // streaks: streaks,
        progress: progress
    );
  }

}