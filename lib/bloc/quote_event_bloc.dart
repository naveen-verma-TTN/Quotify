import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotify/models/quote_list.dart';
import 'package:quotify/repositories/quote_repository.dart';

part 'fetch_quote_event.dart';
part 'quote_event_state.dart';

class QuoteEventBloc extends Bloc<FetchQuoteEvent, QuoteEventState> {
  final QuoteRepository? repository;

  QuoteEventBloc({
    required this.repository,
  })  : assert(repository != null),
        super(QuoteEventEmpty()) {
    on<FetchQuoteEvent>((event, emit) async {
      emit(QuoteEventLoading());
      try {
        final Quote randomQuote = await getRandomQuote(event, emit);
        final QuoteList quoteList = await getQuoteList(event, emit);

        if (quoteList.count == 0 || randomQuote.length == 0) {
          emit(QuoteEventEmpty());
        } else {
          emit(
              QuoteEventLoaded(randomQuote: randomQuote, quoteList: quoteList));
        }
      } catch (_) {
        print('exception $_');
        emit(QuoteEventError());
      }
    });
  }

  Future getQuoteList(
          FetchQuoteEvent event, Emitter<QuoteEventState> emit) async =>
      await repository?.fetchQuoteList();

  Future getRandomQuote(
          FetchQuoteEvent event, Emitter<QuoteEventState> emit) async =>
      await repository?.fetchRandomQuote();
}
