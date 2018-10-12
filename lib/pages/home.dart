import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
    @override
    bool get wantKeepAlive => true;

    @override
    Widget build(BuildContext context) {
        return new Center(
            child: new Text('Home')
        );
    }
}