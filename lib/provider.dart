
import 'package:flutter/widgets.dart';
import 'package:github_bloc/bloc.dart';
import 'package:github_bloc/model.dart';

class RepositoryProvider extends InheritedWidget {
  final RepositoryBloc repositoryBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static RepositoryBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(RepositoryProvider) as RepositoryProvider)
        .repositoryBloc;
  
  RepositoryProvider({Key key, RepositoryBloc repositoryBloc, Widget child})
    : this.repositoryBloc = repositoryBloc ?? RepositoryBloc(API()),
      super(child: child, key: key);
}