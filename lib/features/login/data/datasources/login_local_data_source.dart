import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data/models/user_model.dart';
import '../../../../core/error/exceptions.dart';

abstract class LoginLocalDataSourceAbs {
  Future<UserModel> getCachedUser();
  Future<void> cacheLastUser(UserModel user);
}

class LoginLocalDataSource implements LoginLocalDataSourceAbs {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSource({required this.sharedPreferences});
  @override
  Future<void> cacheLastUser(UserModel user) {
    return sharedPreferences.setString('CACHED_USER', jsonEncode(user.toJson()));
  }

  @override
  Future<UserModel> getCachedUser() {
    final String? jsonData = sharedPreferences.getString('CACHED_USER');
    if (jsonData != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonData)));
    } else {
      throw CacheException();
    }
  }
}
