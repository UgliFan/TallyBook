import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tally_book/widgets/TBKInput.dart';

class CreatePage extends StatefulWidget {
    @override
    CreatePageState createState() => new CreatePageState();
}

class CreatePageState extends State<CreatePage> with AutomaticKeepAliveClientMixin {
    CreatePageState() : super();
    String _date = '';
    String _summary = '';
    int _radioGroupValue = 0;
    final TextEditingController summaryController = new TextEditingController();
    @override
    bool get wantKeepAlive => true;

    @override
    void initState() {
        super.initState();
        summaryController.value = new TextEditingValue(text: _summary ?? '');
    }

    @override
    void dispose() {
        super.dispose();
    }
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
    Widget _buildBody(BuildContext ctx) {
        return new Container(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    _buildCard(ctx, [
                        new IconButton(
                            color: Colors.blue,
                            icon: new Icon(Icons.timer),
                            onPressed: () {
                                DatePicker.showDateTimePicker(ctx, onConfirm: (date) {
                                    setState(() {
                                        _date = _getFormatDate(date);
                                    });
                                }, currentTime: DateTime.now(), locale: 'zh');
                            }
                        ),
                        new Text(_date)
                    ]),
                    _buildCard(ctx, [
                        new Radio(
                            value: 0,
                            groupValue: _radioGroupValue,
                            onChanged: (int value) {
                                setState(() {
                                    _radioGroupValue = value;
                                });
                            },
                        ),
                        new Text('不必要'),
                        new Radio(
                            value: 1,
                            groupValue: _radioGroupValue,
                            onChanged: (int value) {
                                setState(() {
                                    _radioGroupValue = value;
                                });
                            },
                        ),
                        new Text('必要')
                    ]),
                    _buildCard(ctx, [
                        new Expanded(
                            child: new TBKInput(
                                hintText: '输入金额',
                                iconData: Icons.category,
                                obscureText: true,
                                onChanged: (String value) {
                                    _summary = value;
                                },
                                controller: summaryController
                            )
                        )
                    ])
                ]
            )
        );
    }

    Widget _buildCard(BuildContext ctx, List<Widget> children) {
        return new Card(
            elevation: 2.0,
            shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: new Padding(
                padding: EdgeInsets.all(10.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: children
                )
            )
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
            body: _buildBody(context)
        );
    }
}