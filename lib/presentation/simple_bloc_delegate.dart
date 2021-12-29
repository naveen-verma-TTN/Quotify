import 'package:flutter_bloc/flutter_bloc.dart';

/// Created by Naveen Verma on 27-12-2021
/// To The New
/// naveen.verma@tothenew.com

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print("bloc: $bloc is created");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    print("bloc: $bloc is closed");
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print("bloc: $bloc error: $error , $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print("bloc: $bloc transition: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print("bloc: $bloc is changed: $change");
    super.onChange(bloc, change);
  }
}
