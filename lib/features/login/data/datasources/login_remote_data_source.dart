import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/domain/entities/user.dart';
import '../../../../core/util/constant.dart';
import '../models/login_model.dart';
import '../../../token_auth/data/datasource/token_auth_remote_data_source.dart';
import '../../../token_auth/data/repositories/token_auth_repo_imp.dart';
import '../../../token_auth/domain/repositories/token_auth_repository.dart';
import '../../../token_auth/domain/usecases/auth_token.dart';

import '../../../../core/data/models/user_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/util/network.dart';
import 'login_local_data_source.dart';

abstract class LoginRemoteDataSourceAbs {
  Future<UserModel> loginUser(String username, String password);
}

class LoginRemoteDataSource implements LoginRemoteDataSourceAbs {
  final TokenAuthRepositoryImpl tokenAuthRepositoryImpl;
  final Dio dio;

  LoginRemoteDataSource({required this.tokenAuthRepositoryImpl, required this.dio});

  @override
  Future<UserModel> loginUser(String username, String password) async {
    String encryptedPassword = password;
    try {
      Response response = await dio.post(EndPoint.API_ENDPOINT + EndPoint.COMMON_LOGIN, data: {
        'user': username,
        'pass': encryptedPassword,
      });
      LoginModel loginModel = LoginModel.fromJson(response.data);
      final failureOrUser = await tokenAuthRepositoryImpl.authToken(loginModel.token);
      final UserModel user = failureOrUser.fold(
        (l) => throw ServerException(),
        (r) => r,
      );
      return user;
    } on ServerException {
      throw ServerException();
    }
  }
}
