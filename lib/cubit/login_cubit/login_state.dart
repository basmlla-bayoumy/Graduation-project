part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LearnMeLoginLoding extends LoginState {}

class LearnMeLoginSuccess extends LoginState {
  final String uId;

  LearnMeLoginSuccess({required this.uId});
}

class LearnMeLoginError extends LoginState {
  final String error;

  LearnMeLoginError(this.error);
}

class LearnMeChangePassword extends LoginState {}

class LearnMeResertPasswordSuccess extends LoginState {}


