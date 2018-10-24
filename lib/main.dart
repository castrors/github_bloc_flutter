import 'package:flutter/material.dart';
import 'package:github_bloc/bloc.dart';
import 'package:github_bloc/model.dart';
import 'package:github_bloc/provider.dart';
import 'package:github_bloc/repository_widget.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      repositoryBloc: RepositoryBloc(API()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repositoryBloc = RepositoryProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Example'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: StreamBuilder(
              stream: repositoryBloc.results,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => RepositoryWidget(snapshot.data[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}