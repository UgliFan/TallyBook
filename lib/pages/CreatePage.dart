import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreatePage extends StatefulWidget {
    @override
    CreatePageState createState() => new CreatePageState();
}

class CreatePageState extends State<CreatePage> with AutomaticKeepAliveClientMixin {
    @override
    bool get wantKeepAlive => true;

    @override
    void initState() {
        super.initState();
    }

    @override
    void dispose() {
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new CupertinoNavigationBar(
                middle: new Text('记一笔'),
                trailing: new GestureDetector(
                    child: new Icon(Icons.send),
                    onTap: () {
                        print(1);
                    },
                )
            ),
            body: new Center(
                child: new Text('create')
            )
        );
    }
}