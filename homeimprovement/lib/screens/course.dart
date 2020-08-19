import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:homeimprovement/screens/lesson.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Lessons"),
        ),
        body: Query(
          options: QueryOptions(
              document: courseQuery, variables: <String, dynamic>{"id": 1}),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (result.data == null) {
              result.data = {
                "course": {
                  "name": "Gardening",
                  "lessons": [
                    {"name": "tools"},
                    {"name": "soil"},
                    {"name": "plants"}
                  ]
                }
              };
            }

            var course = result.data["course"];

            return Stack(children: <Widget>[
              Text(result.data["course"]["name"],
                  style: TextStyle(fontSize: 20)),
              ListView.builder(
                  itemCount: course["lessons"].length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(course["lessons"][index]["name"]),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/lesson',
                        );
                      },
                    );
                  })
            ]);
          },
        ));
  }
}
