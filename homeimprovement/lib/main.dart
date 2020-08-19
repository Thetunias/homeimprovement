import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:homeimprovement/screens/lesson.dart';
import 'screens/course.dart';

void main() {
  runApp(MaterialApp(
    title: "Homeimprovement",
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MyApp(
            child: CourseScreen(),
          ),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/lesson': (context) => MyApp(child: LessonScreen()),
    },
  ));
}

class MyApp extends StatelessWidget {
  final Widget child;

  MyApp({@required this.child}) : super();

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
      child: child,
      client: client,
    );
  }
}
