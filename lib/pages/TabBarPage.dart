import 'package:flutter/material.dart';
import 'package:tally_book/widgets/TBKTabBar.dart';
import 'package:tally_book/pages/home.dart';
import 'package:tally_book/pages/search.dart';
import 'package:tally_book/pages/mine.dart';
import 'package:tally_book/pages/CreatePage.dart';

class TabBarPage extends StatefulWidget {
    @override
    _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
    final PageController topPageControl = new PageController();
    final List<String> tab = ['首页', '回顾', '我的'];
    int currentTab = 0;

    Widget _getTabIcon(index) {
        if (index == 0) {
            return new Icon(Icons.home, size: 24.0);
        } else if (index == 1) {
            return new Icon(Icons.search, size: 24.0);
        } else {
            return new Icon(Icons.account_circle, size: 24.0);
        }
    }
    _renderTab() {
        List<BottomNavigationBarItem> list = new List();
        for (int i = 0; i < tab.length; i++) {
            list.add(new BottomNavigationBarItem(
                icon: _getTabIcon(i),
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