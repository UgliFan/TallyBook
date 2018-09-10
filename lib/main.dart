import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'widgets/appbar.dart';
import 'pages/home.dart';
import 'pages/create.dart';
import 'pages/search.dart';

void main() {
    runApp(new TallyBookApp());
}

class TallyBookApp extends StatefulWidget {
    @override
    TallyBookAppState createState() => new TallyBookAppState();
}

class TallyBookAppState extends State<TallyBookApp> {
    int _currentTabIndex = 0;
    var _body;
    final _appBarTitles = ['总览', '记一笔', '回顾下过去'];
    void initData() {
        _body = new IndexedStack(
            children: <Widget>[
                new HomePage(),
                new CreatePage(),
                new SearchPage()
            ],
            index: _currentTabIndex
        );
    }
    @override
    Widget build(BuildContext context) {
        initData();
        return new MaterialApp(
            title: 'Tally Book',
            theme: new ThemeData(
                primarySwatch: Colors.orange,
                primaryColor: Colors.grey[100],
                primaryColorBrightness: Brightness.light
            ),
            home: new Scaffold(
                appBar: new CupertinoNavigationBar(
                    middle: new Text(_appBarTitles[_currentTabIndex]),
                    leading: new AppBarLeading(tabIndex: _currentTabIndex, onTap: (e) {
                        print(e);
                        setState(() {
                            _currentTabIndex = 0;
                        });
                    }),
                    trailing: _currentTabIndex == 1 ? new Icon(Icons.send) : new Icon(Icons.photo_camera)
                ),
                body: _body,
                bottomNavigationBar: new CupertinoTabBar(
                    onTap: (index) {
                        setState(() {
                            _currentTabIndex = index;
                        });
                    },
                    currentIndex: _currentTabIndex,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.grey[500],
                    items: <BottomNavigationBarItem>[
                        new BottomNavigationBarItem(title: new Text('首页'), icon: new Icon(Icons.home)),
                        new BottomNavigationBarItem(title: new Text('记一笔'), icon: new Icon(Icons.add)),
                        new BottomNavigationBarItem(title: new Text('回顾'), icon: new Icon(Icons.search))
                    ]
                ),
            ),
        );
    }
}