import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin {
    @override
    bool get wantKeepAlive => true;

    @override
    Widget build(BuildContext context) {
        return new Center(
            child: new Text('Search')
        );
    }
}