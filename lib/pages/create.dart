import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CreatePage extends StatefulWidget {
    @override
    CreatePageState createState() => new CreatePageState();
}

class CreatePageState extends State<CreatePage> {
    String _date = '';
    String _time;
    Widget _getBody(BuildContext ctx) {
        List<Widget> children = [
            new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    new RaisedButton(
                        child: new Text('选择时间'),
                        onPressed: () {
                            DatePicker.showDateTimePicker(ctx, onConfirm: (date) {
                                setState(() {
                                    int year = date.year;
                                    int month = date.month;
                                    int day = date.day;
                                    int min = date.minute;
                                    int sec = date.second;
                                    _date = '$year-$month-$day $min:$sec';
                                });
                            }, currentTime: DateTime.now(), locale: 'zh');
                        }
                    )
                ]
            ),
            new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Text('结果：$_date')
            ),
            new Text('啦啦啦啦阿拉了啦', style: new TextStyle(fontSize: 12.0))
        ];
        return new Container(
            padding: const EdgeInsets.all(5.0),
            child: new Center(
                child: new Column(
                    children: children,
                )
            ),
        );
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
            body: _getBody(context)
        );
    }
}