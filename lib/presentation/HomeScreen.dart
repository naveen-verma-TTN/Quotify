import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotify/bloc/bloc.dart';

/// Created by Naveen Verma on 27-12-2021
/// To The New
/// naveen.verma@tothenew.com

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () => context
                .read<QuoteEventBloc>()
                .add(const FetchRandomQuoteEvent()),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Random Quote',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
          ),
          BlocBuilder<QuoteEventBloc, QuoteEventState>(
            buildWhen: (previousState, nextState) =>
                nextState.randomQuote != null,
            builder: (_, state) {
              print('Build random Quotes');
              if (state is RandomQuoteEventLoaded) {
                var randomQuote = state.randomQuote;
                return ListTile(
                  leading: const Icon(Icons.format_quote_outlined),
                  title: Text(randomQuote?.content.toString() ?? ''),
                  isThreeLine: true,
                  subtitle: Text(randomQuote?.author.toString() ?? ''),
                  dense: true,
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Quotes',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
          ),
          BlocBuilder<QuoteEventBloc, QuoteEventState>(
            buildWhen: (previousState, nextState) =>
                nextState.quoteList != null,
            builder: (context, state) {
              print('Build random Quotes');
              if (state is QuoteEventLoaded) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.quoteList?.results?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var quote = state.quoteList?.results?.elementAt(index);
                      if (quote != null) {
                        return ListTile(
                          leading: const Icon(Icons.format_quote_outlined),
                          title: Text(quote.content.toString()),
                          isThreeLine: true,
                          subtitle: Text(quote.author.toString()),
                          dense: true,
                        );
                      } else {
                        return Container();
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                );
              }
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
