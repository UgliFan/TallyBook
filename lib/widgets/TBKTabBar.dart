import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TBKTabBar extends StatefulWidget {
    final List<BottomNavigationBarItem> tabItems;
    final List<Widget> tabViews;
    final String title;
    final int tabIndex;
    final Widget headerRightPage;
    final PageController topPageControl;
    final ValueChanged<int> onPageChanged;
    final ValueChanged<int> onTabChanged;
    TBKTabBar({
        Key key,
        this.headerRightPage,
        this.tabIndex,
        this.tabItems,
        this.tabViews,
        this.title,
        this.topPageControl,
        this.onPageChanged,
        this.onTabChanged
    }) : super(key: key);
    
    @override
    _TBKTabBarState createState() => new _TBKTabBarState(
        tabViews,
        topPageControl,
        onPageChanged,
        onTabChanged
    );
}

// SingleTickerProviderStateMixin 增加tab切换的动画效果 TickerProviderStateMixin多个嵌套动画
class _TBKTabBarState extends State<TBKTabBar> with SingleTickerProviderStateMixin {
    final List<Widget> _tabViews;
    final PageController _pageController;
    final ValueChanged<int> _onPageChanged;
    final ValueChanged<int> _onTabChanged;
    _TBKTabBarState(
        this._tabViews,
        this._pageController,
        this._onPageChanged,
        this._onTabChanged
    ) : super();

    @override
    void initState() {
        super.initState();
    }

    @override
    void dispose() {
        // 页面销毁时，销毁控制器
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            // 设置侧边滑出 drawer
            // drawer: _drawer,
            // 设置悬浮按钮
            // floatingActionButton: _floatingActionButton,
            appBar: new CupertinoNavigationBar(
                backgroundColor: Theme.of(context).primaryColor,
                middle: new Text(widget.title, style: new TextStyle(color: Colors.white)),
                trailing: new GestureDetector(
                    child: new Icon(Icons.add, color: Colors.orange),
                    onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => widget.headerRightPage));
                    }
                ),
            ),
            body: new PageView(
                controller: _pageController,
                // 每一个tab对应的页面主体，List<Widget>
                children: _tabViews,
                onPageChanged: (index) {
                    _onPageChanged?.call(index);
                },
            ),
            bottomNavigationBar: new CupertinoTabBar(
                currentIndex: widget.tabIndex,
                items: widget.tabItems,
                backgroundColor: Theme.of(context).primaryColor,
                onTap: (index) {
                    _pageController.jumpTo(MediaQuery.of(context).size.width * index);
                    _onTabChanged?.call(index);
                },
            )
        );
    }
}