import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/domain/entities/user.dart';
import '../../../../core/error/failure.dart';
import '../../domain/usecases/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;

  LoginBloc({
    required this.login,
  }) : super(LoginInitial());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is GetUserForLoginAction) {
      yield LoginLoading();

      print('Event GetUserForLoginAction triggered with params: ${event.username}, ${event.password}');
      final failureOrUser = await login(Params(username: event.username, password: event.password));

      yield* eitherLoadedOrErrorState(failureOrUser);
    }
  }

  Stream<LoginState> eitherLoadedOrErrorState(Either<Failure, User> failureOrUser) async* {
    yield failureOrUser.fold(
      (failure) => LoginError(message: mapFailureToMessage(failure)),
      (user) => LoginLoaded(user: user),
    );
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Can not connect to authentication server';
      default:
        return 'Unexpected error';
    }
  }
}
