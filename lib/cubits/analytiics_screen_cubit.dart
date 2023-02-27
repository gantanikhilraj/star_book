import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/repository/mood_repo.dart';

class AnalyticsScreenCubit extends Cubit<CubitState<Mood>> {
  final MoodRepo moodRepo;

  AnalyticsScreenCubit({required this.moodRepo}) : super(const InitialState());

  Future<void> getMood() async {
    emit(const LoadingState());
    await moodRepo.getMoods();
  }

  // Future<void> getMoodFrequencyByDay(
  //     {required int day, required int month, required int year}) async {
  //   emit(const LoadingState());
  //   await moodRepo.getMoodFrequencyByDay(day: day,month: month, year: year);
  // }

  Future<void> getMoodFrequencyByMonth(
      {required int month, required int year}) async {
    emit(const LoadingState());
    await moodRepo.getMoodFrequencyByMonth(month: month, year: year);
  }

  Future<void> getMoodFrequencyByRange(
      {required DateTime start, required DateTime end}) async {
    emit(const LoadingState());
    await moodRepo.getMoodFrequencyByRange(start: start, end: end);
  }
}