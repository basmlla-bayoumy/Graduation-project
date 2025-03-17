part of 'sgin_up_cubit.dart';

@immutable
sealed class SginUpState {}

final class SginUpInitial extends SginUpState {}

class LearnMeSginUpLoding extends SginUpState {}

class LearnMeSginUpSuccess extends SginUpState {}

class LearnMeSginUpError extends SginUpState {
  final String error;

  LearnMeSginUpError(this.error);
}

class LearnMeChangePassword extends SginUpState {}

class LearnMeCreateUserSuccess extends SginUpState {}

class LearnMeCreateUserError extends SginUpState {
  final String error;

  LearnMeCreateUserError(this.error);
}




