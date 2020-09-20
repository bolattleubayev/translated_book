import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String title;

  AppBarTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );
  }
}
