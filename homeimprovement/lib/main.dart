import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'course_screen.dart';

void main() {
  runApp(MaterialApp(title: "Homeimprovement", home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink(uri: "https://a5ad42fdb9a5.ngrok.io/api");
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink as Link,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
      ),
    );
    return GraphQLProvider(
      child: HomePage(),
      client: client,
    );
  }
}

class HomePage extends StatelessWidget {
  final String query = r"""
                    query {
                      user(id: 1) {
                        nameFirst
                      }
                    }
                  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homeimprovement"),
      ),
      body: Query(
        options: QueryOptions(document: query),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (result.data == null) {
            return Text("No Data Found !");
          }
          return CourseScreen();
        },
      ),
    );
  }
}
