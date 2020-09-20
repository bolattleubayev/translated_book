import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../model/book.dart';
import '../widgets/app_bar_title.dart';
import '../widgets/book_completion_bar.dart';

class ReadingScreen extends StatefulWidget {
  final String title;
  final String text;

  ReadingScreen(
    this.title,
    this.text,
  );

  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  int page = 0;

  List<TextSpan> splitText(String textToSplit) {
    // Split string to Spans for tap detection
    final textSpans = <TextSpan>[];

    textToSplit.splitMapJoin(
      RegExp('\\w+'),
      onMatch: (m) {
        final matchStr = m.group(0);

        textSpans.add(
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //print(matchStr);
                return showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Translation'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(
                              '$matchStr',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(Book.dictionaryCopy[matchStr] ??
                                "Нет перевода"),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            text: matchStr,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        );
        return matchStr;
      },
      onNonMatch: (string) {
        textSpans.add(
          TextSpan(
            text: string,
          ),
        );
        return string;
      },
    );

    return textSpans;
  }

  List<String> populatePages(String text) {
    // Splitting a String into 700 characters long pages
    int maxChars = 700;
    List<String> pages = [];
    int numberOfPages = text.length ~/ maxChars; // number of pages

    // Split to substirngs
    for (var i = 0; i < numberOfPages; i++) {
      //print(text.substring(maxChars * i, maxChars * (i + 1)));
      pages.add(
        text.substring(maxChars * i, maxChars * (i + 1)),
      );
    }
    // Add remaining characters
    pages.add(
      text.substring(maxChars * numberOfPages, text.length - 1),
    );
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    // Populate pages
    List<String> pages = populatePages(widget.text);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          title: widget.title,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.blueGrey, //change your color here
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 24),
                children: splitText(pages[page]),
              ),
            ),
          ),
          Column(
            children: [
              BookCompletionBar(
                completed: page,
                total: pages.length,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 60.0,
                      icon: CircleAvatar(
                        radius: 50.0,
                        child: Icon(Icons.chevron_left),
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        if (page == 0) {
                          setState(() {
                            page = 0;
                          });
                        } else {
                          setState(() {
                            page -= 1;
                          });
                        }
                      },
                    ),
                    IconButton(
                      iconSize: 60.0,
                      icon: CircleAvatar(
                        radius: 50.0,
                        child: Icon(Icons.chevron_right),
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        if (page < pages.length - 1) {
                          setState(() {
                            page += 1;
                          });
                        } else {
                          setState(() {
                            page = 0;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
