import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MaterialApp(title: "Homeimprovement", home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink(uri: "https://0b55173487db.ngrok.io/api");
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
                      user(id: 1){
                        name
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
          print(result.data);
          return Text("Text Loaded");
        },
      ),
    );
  }
}
