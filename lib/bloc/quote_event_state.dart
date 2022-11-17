part of 'quote_event_bloc.dart';

abstract class QuoteEventState extends Equatable {
  final QuoteList? quoteList;
  final Quote? randomQuote;
  const QuoteEventState({this.quoteList, this.randomQuote});

  @override
  List<Object?> get props => [quoteList, randomQuote];
}

class QuoteEventEmpty extends QuoteEventState {}

class QuoteEventLoading extends QuoteEventState {}

class QuoteEventError extends QuoteEventState {}

class QuoteEventLoaded extends QuoteEventState {
  const QuoteEventLoaded({QuoteList? quoteList}) : super(quoteList: quoteList);
}

class RandomQuoteEventLoaded extends QuoteEventState {
  const RandomQuoteEventLoaded({
    Quote? randomQuote,
  }) : super(randomQuote: randomQuote);
}
