import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/dataconnect_generated/generated.dart';
import 'package:flutter_app/firebase_options.dart';

class MyApp extends StatelessWidget {
  late final Future<QueryResult<ListMoviesData, void>>
  _movieListFuture;

  MyApp({super.key}) {
    _movieListFuture = ExampleConnector.instance
        .listMovies()
        .execute();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _movieListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Card(
                child: Text(
                  snapshot.data?.data.movies[index].title ?? "",
                ),
              ),
              itemCount: snapshot.data?.data.movies.length ?? 0,
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
