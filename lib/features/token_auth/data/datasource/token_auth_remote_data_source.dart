import 'package:dio/dio.dart';
import '../../../../core/util/constant.dart';
import '../../../../core/data/models/user_model.dart';

abstract class TokenAuthRemoteDataSource {
  Future<UserModel> authToken(String token);
}

class TokenAuthRemoteDataSourceImpl implements TokenAuthRemoteDataSource {
  final Dio dio;

  TokenAuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> authToken(String token) async {
    Response response = await dio.post(
      EndPoint.API_ENDPOINT + EndPoint.TOKEN_AUTH,
      options: Options(headers: {
        'token': token,
      }),
    );
    return Future.value(UserModel.fromJson(response.data));
  }
}
