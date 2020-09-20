import 'package:flutter/material.dart';

import '../model/book.dart';
import '../widgets/app_bar_title.dart';
import '../screens/books_screen.dart';
import '../screens/discover_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Book> books;

  TabsScreen({this.books});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': BooksScreen(
          books: widget.books,
        ),
        'title': 'My Library',
      },
      {
        'page': DiscoverScreen(myBooks: widget.books),
        'title': 'Discover',
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            AppBarTitle(title: _pages[_selectedPageIndex]['title'] as String),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.blueGrey, //change your color here
        ),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.blueGrey,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.library_books),
            title: Text('My Library'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.search),
            title: Text('Discover'),
          ),
        ],
      ),
    );
  }
}
