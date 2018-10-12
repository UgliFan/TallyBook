import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TBKLoading extends StatefulWidget {
    final IndexedWidgetBuilder itemBuilder; // item渲染
    final RefreshCallback onLoadMore; // 加载更多回调
    final RefreshCallback onRefresh; // 下拉刷新回调
    final TBKLoadingControl control; // 控制器，比如数据和一些配置
    final Key refreshKey;
    TBKLoading(this.control, this.itemBuilder, this.onRefresh, this.onLoadMore, {this.refreshKey});
    @override
    _TBKLoadingState createState() => _TBKLoadingState(this.control, this.itemBuilder, this.onRefresh, this.onLoadMore, this.refreshKey);
}

class _TBKLoadingState extends State<TBKLoading> {
    final IndexedWidgetBuilder itemBuilder;
    final RefreshCallback onLoadMore;
    final RefreshCallback onRefresh;
    final TBKLoadingControl control;
    final Key refreshKey;
    _TBKLoadingState(
        this.control,
        this.itemBuilder,
        this.onRefresh,
        this.onLoadMore,
        this.refreshKey
    );

    final ScrollController _scrollController = new ScrollController();
    @override
    void initState() {
        _scrollController.addListener(() {
            if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
                if (this.control.needLoadMore) {
                    this.onLoadMore?.call();
                }
            }
        });
        super.initState();
    }
    // 根据配置状态返回实际列表数量
    // 实际上这里可以根据你的需要做更多的处理
    // 比如多个头部，是否需要空页面，是否需要显示加载更多。
    _getListCount() {
        if (control.needHeader) {
            return control.dataList.length > 0 ? control.dataList.length + 2 : control.dataList.length + 1;
        } else {
            if (control.dataList.length == 0) {
                return 1;
            } else {
                return control.dataList.length > 0 ? control.dataList.length + 1 : control.dataList.length;
            }
        }
    }
    //根据配置状态返回实际列表渲染Item
    _getItem(int index) {
        if (!control.needHeader && index == control.dataList.length && control.dataList.length != 0) {
            //如果不需要头部，并且数据不为0，当index等于数据长度时，渲染加载更多Item（因为index是从0开始）
            return _buildProgressIndicator();
        } else if (control.needHeader && index == _getListCount() - 1 && control.dataList.length != 0) {
            //如果需要头部，并且数据不为0，当index等于实际渲染长度 - 1时，渲染加载更多Item（因为index是从0开始）
            return _buildProgressIndicator();
        } else if (!control.needHeader && control.dataList.length == 0) {
            return _buildEmpty();
        } else {
            return itemBuilder(context, index);
        }
    }

    // 空页面
    Widget _buildEmpty() {
        return new Container(
            height: MediaQuery.of(context).size.height - 100,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    FlatButton(
                        onPressed: () {},
                        child: new Image(image: new AssetImage('static/images/default_face.jpg'), width: 70.0, height: 70.0)
                    ),
                    Container(
                        child: Text('啊啊啊啊啊啊')
                    )
                ]
            )
        );
    }

    // 上拉加载更多
    Widget _buildProgressIndicator() {
        Widget bottomWidget = control.needLoadMore
            ? new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    new SpinKitRotatingCircle(color: Theme.of(context).primaryColor),
                    new Container(width: 5.0),
                    new Text('loading', style: TextStyle(color: Color(0xFF121917), fontSize: 14.0, fontWeight: FontWeight.bold))
                ]
            )
            : new Container();
        return new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Center(
                child: bottomWidget
            )
        );
    }

    @override
    Widget build(BuildContext context) {
        return new RefreshIndicator(
            // GlobalKey，用户外部获取RefreshIndicator的State，做显示刷新
            key: refreshKey,
            // 下拉刷新触发，返回的是一个Future
            onRefresh: onRefresh,
            child: new ListView.builder(
                // 保持ListView任何情况都能滚动，解决在RefreshIndicator的兼容问题。
                physics: const AlwaysScrollableScrollPhysics(),
                // 根据状态返回子控件
                itemBuilder: (context, index) {
                    return _getItem(index);
                },
                // 根据状态返回数量
                itemCount: _getListCount(),
                // 滑动监听
                controller: _scrollController,
            )
        );
    }
}

class TBKLoadingControl {
  ///数据，对齐增减，不能替换
  List dataList = new List();

  ///是否需要加载更多
  bool needLoadMore = true;

  ///是否需要头部
  bool needHeader = false;
}