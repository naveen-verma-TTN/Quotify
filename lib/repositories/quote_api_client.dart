import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotify/models/quote_list.dart';

/// Created by Naveen Verma on 27-12-2021
/// To The New
/// naveen.verma@tothenew.com

class QuoteApiClient {
  final _baseUrl = 'api.quotable.io';
  final http.Client httpClient;

  const QuoteApiClient({
    required this.httpClient,
  });

  Future<QuoteList> fetchQuoteList() async {
    final url = Uri.https(_baseUrl, '/quotes', {'page': '1'});
    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);

    return QuoteList.fromJson(json);
  }

  Future<Quote> fetchRandomQuote() async {
    final url = Uri.https(_baseUrl, '/random');
    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);

    return Quote.fromJson(json);
  }
}
