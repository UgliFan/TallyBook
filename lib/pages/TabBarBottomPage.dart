import 'package:flutter/material.dart';
import 'package:tally_book/widgets/TBKTabBar.dart';
import 'package:tally_book/pages/home.dart';
import 'package:tally_book/pages/search.dart';
import 'package:tally_book/pages/mine.dart';
import 'package:tally_book/pages/CreatePage.dart';

class TabBarBottomPage extends StatefulWidget {
    @override
    _TabBarBottomPageState createState() => _TabBarBottomPageState();
}

class _TabBarBottomPageState extends State<TabBarBottomPage> {
    final PageController topPageControl = new PageController();
    final List<String> tab = ['首页', '回顾', '我的'];
    int currentTab = 0;

    _renderTab() {
        List<BottomNavigationBarItem> list = new List();
        for (int i = 0; i < tab.length; i++) {
            list.add(new BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text(
                    tab[i],
                    maxLines: 1,
                    style: new TextStyle(color: Theme.of(context).buttonColor)
                )
            ));
        }
        return list;
    }

    _renderPage() {
        return [
            new HomePage(),
            new SearchPage(),
            new MinePage()
        ];
    }

    @override
    Widget build(BuildContext context) {
        return new TBKTabBar(
            headerRightPage: new CreatePage(),
            tabIndex: currentTab,
            tabItems: _renderTab(),
            tabViews: _renderPage(),
            title: tab[currentTab],
            topPageControl: topPageControl,
            onPageChanged: (int index) {
                setState(() {
                    currentTab = index;
                });
            },
            onTabChanged: (int index) {
                setState(() {
                    currentTab = index;
                });
            },
        );
    }
}