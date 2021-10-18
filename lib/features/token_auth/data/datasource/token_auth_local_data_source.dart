import 'dart:convert';

import '../../../../core/error/exceptions.dart';
import '../../../../core/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenAuthLocalDataSource {
  Future<UserModel> getLastUser();
  Future<void> cacheUser(UserModel userModel);
}

class TokenAuthLocalDataSourceImpl implements TokenAuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  TokenAuthLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheUser(UserModel userModel) {
    return sharedPreferences.setString('CACHED_USER', jsonEncode(userModel.toJson()));
  }

  @override
  Future<UserModel> getLastUser() {
    final String? jsonData = sharedPreferences.getString('CACHED_USER');
    if (jsonData != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonData)));
    } else {
      throw CacheException();
    }
  }
}
