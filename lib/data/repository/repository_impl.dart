import 'package:avanced_course/data/data_source/remote_data_source.dart';
import 'package:avanced_course/data/mapper/mapper.dart';
import 'package:avanced_course/data/network/failure.dart';
import 'package:avanced_course/data/network/network_info.dart';
import 'package:avanced_course/data/network/requests.dart';
import 'package:avanced_course/domain/models/models.dart';
import 'package:avanced_course/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository{
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
  if(await _networkInfo.isConnected){
    final response = await _remoteDataSource.login(loginRequest);
    if(response.status == 0){
      return Right(response.toDomain());
    }
    else{
      return Left(Failure(409,response.message ?? "there is an error, we are sorry!"));
    }
  }else{
    return Left(Failure(501,"check your internet connection"));
  }
  }

}