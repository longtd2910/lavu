import 'package:dio/dio.dart';

import '../../../../core/data/models/user_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/util/constant.dart';
import '../../../token_auth/data/repositories/token_auth_repo_imp.dart';
import '../models/login_model.dart';

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
