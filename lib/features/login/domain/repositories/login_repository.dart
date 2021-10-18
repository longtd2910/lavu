import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/user.dart';
import '../../../../core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> loginWithCommonCredential(String username, String password);
}
