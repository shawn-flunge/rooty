


import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';


@freezed
abstract class HomePageState with _$HomePageState{

  const factory HomePageState({
    @Default([]) List<DateTime> streaks,
    @Default(0) int currentProgress
  }) = _HomePageState;

}