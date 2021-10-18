import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/domain/entities/user.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/login_repository.dart';

class Params extends Equatable {
  final String username;
  final String password;

  const Params({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class Login implements UseCase<User, Params> {
  final LoginRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.loginWithCommonCredential(params.username, params.password);
  }
}
