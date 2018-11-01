import 'dart:async';

import 'package:github_bloc/model.dart';
import 'package:rxdart/rxdart.dart';

class RepositoryBloc {
  final API api;

  StreamController<List<Repository>> _repositoryController = StreamController<List<Repository>>.broadcast();
  Sink<List<Repository>> get _inRepositories => _repositoryController.sink;
  Stream<List<Repository>> get results => _repositoryController.stream;
  
  RepositoryBloc(this.api){
    api.get().then((repositories){
      print(repositories);
      _inRepositories.add(repositories);
    });
  }

  void dispose(){
    _repositoryController.close();
  }
}