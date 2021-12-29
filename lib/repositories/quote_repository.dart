import 'package:quotify/models/quote_list.dart';
import 'package:quotify/repositories/quote_api_client.dart';

/// Created by Naveen Verma on 27-12-2021
/// To The New
/// naveen.verma@tothenew.com

class QuoteRepository {
  final QuoteApiClient quoteApiClient;

  const QuoteRepository({
    required this.quoteApiClient,
  });

  Future<QuoteList> fetchQuoteList() async {
    return await quoteApiClient.fetchQuoteList();
  }

  Future<Quote> fetchRandomQuote() async {
    return await quoteApiClient.fetchRandomQuote();
  }
}
