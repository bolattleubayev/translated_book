import 'package:flutter/material.dart';
import '../model/book.dart';
import '../screens/book_detail_screen.dart';
import '../widgets/app_bar_title.dart';

class BooksScreen extends StatefulWidget {
  final List<Book> books;

  BooksScreen({this.books});

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemCount: widget.books.length,
      itemBuilder: (ctx, index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailScreen(
                        book: widget.books[index],
                        fromMyLibrary: true,
                      ),
                    ),
                  );
                },
                child: GridTile(
                  child: Image.asset(
                    widget.books[index].imageURL,
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                    height: 70.0,
                    color: Colors.black54,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          widget.books[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
