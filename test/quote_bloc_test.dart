import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quotify/bloc/bloc.dart';
import 'package:quotify/models/quote_list.dart';

import 'quote_repository_mock.dart';

/// Created by Naveen Verma on 27-12-2021
/// To The New
/// naveen.verma@tothenew.com

@GenerateMocks([MockQuoteRepository])
void main() {
  group('Quote Bloc', () {
    late QuoteEventBloc quoteEventBloc;
    late MockQuoteRepository quoteRepository;
    final quote = Quote(
      length: 3,
      id: "1234",
      authorSlug: "xyz",
      author: "xyz",
      tags: ['abc', 'ace'],
      content: 'abc',
    );
    final QuoteList mockQuote = QuoteList(
      count: 1,
      totalCount: 1,
      page: 1,
      totalPages: 1,
      lastItemIndex: 0,
      results: [
        quote,
      ],
    );

    setUp(() {
      quoteRepository = MockQuoteRepository();
      quoteEventBloc = QuoteEventBloc(repository: quoteRepository);
    });

    test('should assert if null', () {
      expect(() => QuoteEventBloc(repository: null), throwsA(isAssertionError));
    });

    test('initial state is correct', () {
      expect(quoteEventBloc.state, QuoteEventEmpty());
    });

    blocTest<QuoteEventBloc, QuoteEventState>(
      'emits [QuoteEmpty, QuoteLoading, QuoteLoaded] when FetchQuote is added and fetchQuote failed',
      build: () {
        return quoteEventBloc;
      },
      act: (bloc) => bloc.add(const FetchQuoteEvent()),
      expect: () => [QuoteEventLoading(), QuoteEventError()],
    );

    blocTest<QuoteEventBloc, QuoteEventState>(
      'emits [QuoteEmpty, QuoteLoading, QuoteLoaded] when FetchQuote is added and fetchQuote succeeds',
      build: () {
        when(quoteRepository.fetchQuoteList()).thenAnswer(
          (_) => Future.value(mockQuote),
        );
        return quoteEventBloc;
      },
      act: (bloc) => bloc.add(const FetchQuoteEvent()),
      expect: () => [
        QuoteEventLoading(),
        QuoteEventLoaded(randomQuote: quote, quoteList: mockQuote)
      ],
    );

    tearDown(() {
      quoteEventBloc.close();
    });
  });
}
