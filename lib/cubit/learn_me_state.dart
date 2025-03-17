part of 'learn_me_cubit.dart';

@immutable
abstract  class LearnMeState {}

final class LearnMeInitial extends LearnMeState {}

final class LearnMeGetUserSuccess extends LearnMeState {}

final class LearnMeGetUserError extends LearnMeState {
  final String error;

  LearnMeGetUserError(this.error);
}
final class LearnMeGetUserLoading extends LearnMeState {}

final class LearnMeGetImageLoading extends LearnMeState {}
final class LearnMeGetImageSuccess extends LearnMeState {}
final class LearnMeGetImageError extends LearnMeState {
  final String error;

  LearnMeGetImageError({required this.error});
}

final class LearnMeCreateImageLoading extends LearnMeState {}
final class LearnMeCreateImageSuccess extends LearnMeState {}
final class LearnMeCreateImageError extends LearnMeState {
  final String error;

  LearnMeCreateImageError({required this.error});
}

final class LearnMeChangeBottomNav extends LearnMeState {}
class LearnMeSignOutLoding extends LearnMeState {}

class LearnMeSignOutSuccess extends LearnMeState {}