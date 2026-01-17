import 'package:bloc/bloc.dart';
import 'package:clean_app/core/errors/failure.dart';
import 'package:clean_app/core/usecases/usecases.dart';
import 'package:clean_app/core/utils/strings.dart';
import 'package:clean_app/features/random_quote/domain/entities/quote.dart';
import 'package:clean_app/features/random_quote/domain/usecases/generate_quote.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
part 'random_quote_state.dart';


class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GenerateQuoteUseCase generateRandomQuoteUseCase;

  RandomQuoteCubit({required this.generateRandomQuoteUseCase}) : super(RandomQuoteInitial());

Future<void> getRandomQuote()async{
Either<Failure,Quote> response = await generateRandomQuoteUseCase(NoParams());

emit(
  response.fold(
    (failure)=>RandomQuoteisError(errMessage: mapFailure(failure)), 
    (quote)=>RandomQuoteisLoaded(quote: quote)),

);
}


String mapFailure(Failure failure){
switch(failure.runtimeType){
case NetworkFailure() : return AppStrings.serverFailure;
case CacheFailure() : return AppStrings.cacheFailure;

default:
return AppStrings.unexpectedFailure;
}

}

}


