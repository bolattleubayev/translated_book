import 'package:flutter/material.dart';

class BookCompletionBar extends StatelessWidget {
  final int completed;
  final int total;

  BookCompletionBar({
    this.completed,
    this.total,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: completed,
                child: Container(
                  height: 3.0,
                  color: Colors.black,
                ),
              ),
              Flexible(
                flex: total - completed - 1,
                child: Container(
                  height: 3.0,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text("${completed + 1} out of $total"),
        ],
      ),
    );
  }
}
