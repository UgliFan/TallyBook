import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/home.dart';
import 'pages/create.dart';
import 'pages/search.dart';
import 'package:amap_location/amap_location.dart';

void main() {
    AMapLocationClient.setApiKey('7009610864addb3a7841226c78ccf517');
    runApp(new TallyBookApp());
}

class TallyBookApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Tally Book',
            theme: new ThemeData(
                primarySwatch: Colors.orange,
                primaryColor: Colors.grey[100],
                primaryColorBrightness: Brightness.light
            ),
            home: new HomeScreen()
        );
    }
}

class HomeScreen extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => new _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
    int _currentTabIndex = 0;
    var _body;
    final _appBarTitles = ['总览', '回顾下过去'];
    void initData() {
        _body = new IndexedStack(
            children: <Widget>[
                new HomePage(),
                new SearchPage()
            ],
            index: _currentTabIndex
        );
    }
    @override
    void initState() {
        AMapLocationClient.startup(new AMapLocationOption(desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
        super.initState();
    }
    @override
    void dispose() {
        AMapLocationClient.shutdown();
        super.dispose();
    }
    @override
    Widget build(BuildContext context) {
        initData();
        return new Scaffold(
            appBar: new CupertinoNavigationBar(
                middle: new Text(_appBarTitles[_currentTabIndex]),
                leading: new GestureDetector(
                    child: new Icon(Icons.account_circle),
                    onTap: () {
                        print(1); // TODO
                    }
                ),
                trailing: new IconButton(
                    icon: new Icon(Icons.add),
                    onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (ctx) {
                                return new CreatePage();
                            }
                        ));
                    },
                )
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
                    new BottomNavigationBarItem(title: new Text('回顾'), icon: new Icon(Icons.search))
                ]
            ),
        );
    }
}
