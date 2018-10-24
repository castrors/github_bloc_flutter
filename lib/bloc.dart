import 'dart:async';

import 'package:github_bloc/model.dart';
import 'package:rxdart/rxdart.dart';

class RepositoryBloc {
  final API api;

  Stream<List<Repository>> _results = Stream.empty();
  Stream<List<Repository>> get results => _results;
  
  RepositoryBloc(this.api){
    _results = Observable(results).asBroadcastStream();
  }
}