import 'package:clean_app/core/errors/failure.dart';
import 'package:clean_app/core/usecases/usecases.dart';
import 'package:clean_app/features/random_quote/domain/entities/quote.dart';
import 'package:clean_app/features/random_quote/domain/repositories/repo.dart';
import 'package:dartz/dartz.dart';

class GenerateQuoteUseCase implements Usecases<Quote, NoParams> {
  final QuoteRepo quoteRepo; 
  GenerateQuoteUseCase({required this.quoteRepo});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) => quoteRepo.getQuote();
}
