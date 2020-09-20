import 'package:flutter/material.dart';

import '../model/book.dart';
import '../widgets/read_button.dart';
import '../widgets/app_bar_title.dart';
import '../widgets/add_book_to_library.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  final List<Book> myLibrary;
  final bool fromMyLibrary;
  final Function discoverFunction;

  BookDetailScreen({
    this.book,
    this.myLibrary,
    this.fromMyLibrary,
    this.discoverFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          title: book.title,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.blueGrey, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                book.imageURL,
                height: 300.0,
              ),
              Text(
                book.title,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (fromMyLibrary)
                ReadButton(
                  book: book,
                ),
              if (!fromMyLibrary)
                AddBookToLibrary(
                  bookToAdd: book,
                  myLibrary: myLibrary,
                  discoverCallback: discoverFunction,
                ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  book.promotionalText,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
