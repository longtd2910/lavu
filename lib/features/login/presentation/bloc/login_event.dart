part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GetUserForLoginAction extends LoginEvent {
  final String username;
  final String password;

  const GetUserForLoginAction({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

class NavigateToForgotPassword extends LoginEvent {
  final String username;

  const NavigateToForgotPassword({
    required this.username,
  });

  @override
  List<Object?> get props => [username];
}
