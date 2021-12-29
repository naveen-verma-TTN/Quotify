part of 'quote_event_bloc.dart';

abstract class QuoteEventState extends Equatable {
  const QuoteEventState();

  @override
  List<Object> get props => [];
}

class QuoteEventEmpty extends QuoteEventState {}

class QuoteEventLoading extends QuoteEventState {}

class QuoteEventError extends QuoteEventState {}

class QuoteEventLoaded extends QuoteEventState {
  final QuoteList quoteList;
  final Quote randomQuote;

  const QuoteEventLoaded({
    required this.randomQuote,
    required this.quoteList,
  });

  @override
  List<Object> get props => [quoteList];
}
