import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => new _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
    @override
    bool get wantKeepAlive => true;

    @override
    Widget build(BuildContext context) {
        return new Center(
            child: new Text('Mine')
        );
    }
}