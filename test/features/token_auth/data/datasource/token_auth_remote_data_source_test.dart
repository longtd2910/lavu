import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lavu/features/token_auth/data/datasource/token_auth_remote_data_source.dart';
import 'package:lavu/core/data/models/user_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('should return a UserModel when API connect success', () async {
    TokenAuthRemoteDataSourceImpl remoteDataSourceImpl;
    remoteDataSourceImpl = TokenAuthRemoteDataSourceImpl(dio: Dio());

    final UserModel model = await remoteDataSourceImpl.authToken('2cc66a4e-21da-44ec-86ad-ab5de4ad09d2');

    final testModel = UserModel.fromJson(json.decode(fixture('token_auth_response.json')));

    expect(model, testModel);
  });
}
