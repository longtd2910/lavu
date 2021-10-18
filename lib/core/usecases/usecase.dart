import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param params);
}
