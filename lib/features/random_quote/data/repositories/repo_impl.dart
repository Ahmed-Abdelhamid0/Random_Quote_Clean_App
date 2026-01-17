import 'package:clean_app/core/errors/exceptions.dart';
import 'package:clean_app/core/errors/failure.dart';
import 'package:clean_app/core/network/network_service.dart';
import 'package:clean_app/features/random_quote/data/datasources/local.dart';
import 'package:clean_app/features/random_quote/data/datasources/remote.dart';
import 'package:clean_app/features/random_quote/domain/entities/quote.dart';
import 'package:clean_app/features/random_quote/domain/repositories/repo.dart';
import 'package:dartz/dartz.dart';

class QuoteRepoImpl implements QuoteRepo {
  final NetworkInfoService networkInfo;
  final QuoteRemoteDatasource quoteRomoteDatasource;
  final QuoteLocalDatasource quoteLocalDatasource;

  QuoteRepoImpl({
    required this.networkInfo,
    required this.quoteRomoteDatasource,
    required this.quoteLocalDatasource,
  });

  // ToDo: get data if there is a connection
  @override
  Future<Either<Failure, Quote>> getQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteQuote = await quoteRomoteDatasource.getData();
        quoteLocalDatasource.cachedData(remoteQuote);   //get last quote from server if no connection
        return Right(remoteQuote);
      } on NetworkException {
        return Left(NetworkFailure());
      }



      // ToDo: get last quote if there is no a connection
    } else {
      try {
        final localQuote = await quoteLocalDatasource.getData();
        return Right(localQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
