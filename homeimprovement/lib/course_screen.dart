import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CourseScreen extends StatelessWidget {
  final String courseQuery = r"""
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
    return Query(
      options: QueryOptions(
          document: courseQuery, variables: <String, dynamic>{"id": 1}),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (result.data == null) {
          return Text("Course not found!");
        }

        var course = result.data["course"];

        return Stack(children: <Widget>[
          Text(result.data["course"]["name"], style: TextStyle(fontSize: 20)),
          ListView.builder(
              itemCount: course["lessons"].length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(course["lessons"][index]["name"]));
              })
        ]);
      },
    );
  }
}
