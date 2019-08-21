import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: CategoriesPage(),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  final List<dynamic> categories = [
    {"title": "Category 1"},
    {"title": "Category 2"},
    {"title": "Category 3"},
    {"title": "Category 4"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            tooltip: 'Login',
            onPressed: () {},
          ),
        ],
      ),
      body: CategoriesList(
        categories: categories,
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key key, @required this.categories}) : super(key: key);

  final List categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return ListTile(title: Text(category['title']));
      },
    );
  }
}
