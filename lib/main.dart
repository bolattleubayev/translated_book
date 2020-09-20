import 'package:flutter/material.dart';

import './model/book.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Book> _books = Book.loadDefaultBooks;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 35.0,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: TabsScreen(
        books: _books,
      ),
    );
  }
}
