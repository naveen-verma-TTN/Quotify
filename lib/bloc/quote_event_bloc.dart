import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotify/models/quote_list.dart';
import 'package:quotify/repositories/quote_repository.dart';

part 'fetch_quote_event.dart';
part 'quote_event_state.dart';

class QuoteEventBloc extends Bloc<QuoteEvent, QuoteEventState> {
  final QuoteRepository? repository;

  QuoteEventBloc({
    required this.repository,
  })  : assert(repository != null),
        super(QuoteEventEmpty()) {
    on<QuoteEvent>((event, emit) async {
      try {
        // for fetching QuoteList and RandomQuote
        if (event is FetchQuoteEvent) {
          emit(QuoteEventLoading());
          final QuoteList quoteList = await getQuoteList(event, emit);

          if (quoteList.count == 0) {
            emit(QuoteEventEmpty());
          } else {
            emit(QuoteEventLoaded(quoteList: quoteList));
          }
        } else if (event is FetchRandomQuoteEvent) {
          // for fetching RandomQuote
          final Quote randomQuote = await getRandomQuote(event, emit);
          emit(RandomQuoteEventLoaded(randomQuote: randomQuote));
        }
      } catch (_) {
        print('exception $_');
        emit(QuoteEventError());
      }
    });
  }

  Future getQuoteList(QuoteEvent event, Emitter<QuoteEventState> emit) async =>
      await repository?.fetchQuoteList();

  Future getRandomQuote(
          QuoteEvent event, Emitter<QuoteEventState> emit) async =>
      await repository?.fetchRandomQuote();
}
