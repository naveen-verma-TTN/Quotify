import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:quotify/bloc/bloc.dart';
import 'package:quotify/presentation/HomeScreen.dart';
import 'package:quotify/presentation/simple_bloc_delegate.dart';
import 'package:quotify/repositories/quote_api_client.dart';
import 'package:quotify/repositories/quote_repository.dart';

void main() {
  final QuoteRepository repository = QuoteRepository(
    quoteApiClient: QuoteApiClient(
      httpClient: http.Client(),
    ),
  );

  Bloc.observer = SimpleBlocDelegate(); // attaching observers to bloc
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final QuoteRepository repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuoteEventBloc>(
      create: (context) => QuoteEventBloc(repository: repository)
        ..add(const FetchQuoteEvent())
        ..add(const FetchRandomQuoteEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(title: 'Quotify'),
      ),
    );
  }
}
