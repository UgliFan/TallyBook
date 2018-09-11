import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CreatePage extends StatefulWidget {
    @override
    CreatePageState createState() => new CreatePageState();
}

class CreatePageState extends State<CreatePage> {
    String _getFormatDate(DateTime date) {
        int year = date.year;
        String month = date.month.toString();
        if (date.month < 10) month = '0$month';
        String day = date.day.toString();
        if (date.day < 10) day = '0$day';
        String min = date.minute.toString();
        if (date.minute < 10) min = '0$min';
        String sec = date.second.toString();
        if (date.second < 10) sec = '0$sec';
        return '$year-$month-$day $min:$sec';
    }
    String _date = '';
    String _location = '不明';
    Widget _getBody(BuildContext ctx) {
        List<Widget> children = [
            Row(
                children: <Widget>[
                    Text('时间: $_date'),
                    CupertinoButton(
                        child: Text('修改', style: TextStyle(fontSize: 14.0)),
                        onPressed: () {
                            DatePicker.showDateTimePicker(ctx, onConfirm: (date) {
                                setState(() {
                                    _date = _getFormatDate(date);
                                });
                            }, currentTime: DateTime.now(), locale: 'zh');
                        }
                    )
                ]
            ),
            Row(
                children: <Widget>[
                    Text('地点: ', style: TextStyle(fontSize: 14.0)),
                    IconButton(
                        icon: Icon(Icons.my_location),
                        onPressed: () {
                            print(_location);
                        },
                    )
                ],
            )
        ];
        return Container(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
                children: children,
            ),
        );
    }
    @override
    Widget build(BuildContext context) {
        _date = _getFormatDate(DateTime.now());
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