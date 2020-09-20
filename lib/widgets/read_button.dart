import 'package:flutter/material.dart';
import '../model/book.dart';
import '../screens/reading_screen.dart';

class ReadButton extends StatelessWidget {
  final Book book;

  ReadButton({this.book});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.book,
            color: Colors.white,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            'read',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadingScreen(
              book.title,
              book.text,
            ),
          ),
        );
      },
    );
  }
}
