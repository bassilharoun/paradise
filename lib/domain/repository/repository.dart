import 'package:avanced_course/data/network/failure.dart';
import 'package:avanced_course/data/network/requests.dart';
import 'package:avanced_course/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository{
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}

