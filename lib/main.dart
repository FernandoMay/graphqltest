import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  final HttpLink httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  /*
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <TOKEN>',
  );

  final Link link = authLink.concat(httpLink);
  */
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink,
    ),
  );

  runApp(MyApp(client));
}

class MyApp extends StatelessWidget {
  
  final ValueNotifier<GraphQLClient> cliente = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: ""),
    ),
  );

  MyApp(cliente);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: cliente,
      child: CacheProvider(
        child: MaterialApp(
          title: 'GraphQL Demo',
        ),
      ),
    );
  }
}
