import 'package:dartz/dartz.dart';

import '../../../../core/data/models/user_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/util/network.dart';
import '../../domain/repositories/token_auth_repository.dart';
import '../datasource/token_auth_local_data_source.dart';
import '../datasource/token_auth_remote_data_source.dart';

class TokenAuthRepositoryImpl implements TokenAuthRepository {
  final TokenAuthRemoteDataSource remoteDataSource;
  final TokenAuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TokenAuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserModel>> authToken(String token) async {
    if (await networkInfo.isConnected) {
      try {
        final UserModel remoteUser = await remoteDataSource.authToken(token);
        await localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final UserModel localUser = await localDataSource.getLastUser();
        return Right(localUser);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
