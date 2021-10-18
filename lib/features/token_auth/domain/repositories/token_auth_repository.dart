import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/user.dart';
import '../../../../core/error/failure.dart';

abstract class TokenAuthRepository {
  Future<Either<Failure, User>> authToken(String token);
}
