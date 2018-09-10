import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppBarLeading extends StatefulWidget {
    final tabIndex;
    final ValueChanged<int> onTap;
    AppBarLeading({Key key, @required this.tabIndex, this.onTap}) : super(key: key);
    @override
    _AppBarLeadingState createState() => new _AppBarLeadingState();
}

class _AppBarLeadingState extends State<AppBarLeading> {
    @override
    Widget build(BuildContext context) {
        return widget.tabIndex == 0
            ? new Icon(Icons.account_circle)
            : new GestureDetector(
                child: new Icon(Icons.arrow_back_ios),
                onTap: () {
                    widget.onTap(1);
                },
            );
    }
}