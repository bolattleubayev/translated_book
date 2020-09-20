import 'package:flutter/material.dart';
import '../model/book.dart';

class AddBookToLibrary extends StatelessWidget {
  final Book bookToAdd;
  final List<Book> myLibrary;
  final Function discoverCallback;

  AddBookToLibrary({
    this.bookToAdd,
    this.myLibrary,
    this.discoverCallback,
  });

  bool isInMyLibrary(Book discoverBook) {
    for (Book book in myLibrary) {
      if (book.id == discoverBook.id) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return !isInMyLibrary(bookToAdd)
        ? RaisedButton(
            color: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.file_download,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'download book',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onPressed: () {
              //myLibrary.add(bookToAdd);
              discoverCallback();
            },
          )
        : Container();
  }
}
