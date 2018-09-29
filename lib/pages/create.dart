import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:amap_location/amap_location.dart';

class CreatePage extends StatefulWidget {
    @override
    CreatePageState createState() => new CreatePageState();
}

class CreatePageState extends State<CreatePage> {
    TextEditingController _controller = new TextEditingController();
    String _loc;
    double latitude = 0.0;
    double longtude = 0.0;
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
    Widget _getBody(BuildContext ctx) {
        List<Widget> children = [
            Row(
                children: <Widget>[
                    IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.timer),
                        onPressed: () {
                            DatePicker.showDateTimePicker(ctx, onConfirm: (date) {
                                setState(() {
                                    _date = _getFormatDate(date);
                                });
                            }, currentTime: DateTime.now(), locale: 'zh');
                        },
                    ),
                    Text('时间: $_date')
                ]
            ),
            Row(
                children: <Widget>[
                    IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.my_location),
                        onPressed: () {
                            getLocationStr();
                        },
                    ),
                    Flexible(
                        child: Column(
                            children: <Widget>[Text('地址:$_loc', style: TextStyle(fontSize: 14.0))]
                        )
                    )
                ],
            ),
            TextField(
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0))
                    ),
                    hintText: 'Please enter a search term'
                ),
                controller: _controller
            )
        ];
        return Container(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
                children: children,
            ),
        );
    }
    void getLocationStr() async {
        try {
            AMapLocation loc = await AMapLocationClient.getLocation(true);
            String info;
            if (loc == null) {
                info = '正在定位...';
            } else if (loc.isSuccess()) {
                if (loc.hasAddress()) {
                    info = '${loc.formattedAddress}'; // 城市:${loc.city} 省:${loc.province}
                } else {
                    info = '不详';
                }
                latitude = loc.latitude;
                longtude = loc.longitude;
            } else {
                info = '定位失败(错误:{code=${loc.code},description=${loc.description})';
            }
            setState(() {
                _loc = info;
            });
        } catch (e) {
            print(e.toString());
        }
    }
    @override
    void initState() {
        AMapLocationClient.setApiKey('7009610864addb3a7841226c78ccf517');
        AMapLocationClient.startup(new AMapLocationOption(desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
        getLocationStr();
        _date = _getFormatDate(new DateTime.now());
        super.initState();
    }
    @override
    void dispose() {
        AMapLocationClient.stopLocation();
        AMapLocationClient.shutdown();
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
            body: _getBody(context)
        );
    }
}