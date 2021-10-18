import 'package:dartz/dartz.dart';

import '../../../../core/data/models/user_model.dart';
import '../../../../core/domain/entities/user.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/util/network.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_local_data_source.dart';
import '../datasources/login_remote_data_source.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> loginWithCommonCredential(String username, String password) async {
    final UserModel user;
    if (await networkInfo.isConnected) {
      try {
        user = await remoteDataSource.loginUser(username, password);
        await localDataSource.cacheLastUser(user);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        user = await localDataSource.getCachedUser();
        return Right(user);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
