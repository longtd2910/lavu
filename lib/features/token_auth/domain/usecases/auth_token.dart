import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/domain/entities/user.dart';
import '../repositories/token_auth_repository.dart';

class Params extends Equatable {
  final String token;

  const Params({required this.token});

  @override
  List<Object?> get props => [token];
}

class AuthToken implements UseCase<User, Params> {
  final TokenAuthRepository repository;

  AuthToken(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.authToken(params.token);
  }
}
