import 'package:flutter/material.dart';
import '../model/book.dart';
import '../screens/book_detail_screen.dart';

class DiscoverScreen extends StatefulWidget {
  final List<Book> myBooks;

  DiscoverScreen({this.myBooks});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<Book> discoverableBooks = Book.loadDiscoverableBooks;

  bool isInMyLibrary(Book discoverBook) {
    for (Book book in widget.myBooks) {
      if (book.id == discoverBook.id) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemCount: discoverableBooks.length,
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
                        book: discoverableBooks[index],
                        myLibrary: widget.myBooks,
                        fromMyLibrary: false,
                        discoverFunction: () {
                          setState(() {
                            widget.myBooks.add(discoverableBooks[index]);
                          });
                        },
                      ),
                    ),
                  );
                },
                child: GridTile(
                  header: isInMyLibrary(discoverableBooks[index])
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 7.0,
                                horizontal: 5.0,
                              ),
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  child: Image.asset(
                    discoverableBooks[index].imageURL,
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
                          discoverableBooks[index].title,
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
    ;
  }
}
