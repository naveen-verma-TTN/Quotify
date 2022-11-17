part of 'quote_event_bloc.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();
}

class FetchQuoteEvent extends QuoteEvent {
  const FetchQuoteEvent();

  @override
  List<FetchQuoteEvent?> get props => [];
}

class FetchRandomQuoteEvent extends QuoteEvent {
  const FetchRandomQuoteEvent();

  @override
  List<FetchQuoteEvent?> get props => [];
}
