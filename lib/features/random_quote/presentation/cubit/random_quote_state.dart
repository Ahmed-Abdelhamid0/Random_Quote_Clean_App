part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteisLoading extends RandomQuoteState {}

class RandomQuoteisLoaded extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteisLoaded({required this.quote});

  @override
  List<Object> get props => [quote];
}

class RandomQuoteisError extends RandomQuoteState {
  final String errMessage;

  const RandomQuoteisError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
