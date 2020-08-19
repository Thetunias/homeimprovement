import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LessonScreen extends StatelessWidget {
  final String lessonQuery = r"""
    query courseQuery($id: ID!) {
      course(id: $id) {
        name
        lessons {
          name
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lessons"),
        ),
        body: Query(
          options: QueryOptions(
              document: lessonQuery, variables: <String, dynamic>{"id": 1}),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (result.data == null) {
              result.data = {
                "lesson": {"name": "tools", "markup": "#Hello"},
              };
            }

            var lesson = result.data["lesson"];

            return Column(children: <Widget>[
              Text(lesson["name"], style: TextStyle(fontSize: 20)),
              Text(lesson["markup"], style: TextStyle(fontSize: 20))
            ]);
          },
        ));
  }
}
