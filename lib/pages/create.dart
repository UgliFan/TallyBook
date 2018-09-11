import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:amap_location/amap_location.dart';
// import 'package:simple_permissions/simple_permissions.dart';

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
    String getLocationStr(AMapLocation loc) {
        if (loc == null) {
            return "正在定位";
        }
        if (loc.isSuccess()) {
            if (loc.hasAddress()) {
                return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n 地址:${loc.formattedAddress} 城市:${loc.city} 省:${loc.province}";
            } else {
                return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n ";
            }
        } else {
            return "定位失败: \n错误:{code=${loc.code},description=${loc.description}";
        }
    }
    // void _checkPersmission() async {
    //     bool hasPermission = await SimplePermissions.checkPermission(Permission.WhenInUseLocation);
    //     if(!hasPermission){
    //         bool requestPermissionResult = await SimplePermissions.requestPermission(Permission.WhenInUseLocation);
    //         if(!requestPermissionResult){
    //             print("申请定位权限失败");
    //             return;
    //         }
    //     }
    //     AMapLocation loc = await AMapLocationClient.getLocation(true);
    //     setState(() {
    //         _loc = loc;
    //     });
    // }
    String _date = '';
    String _location = '不明';
    AMapLocation _loc;
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
                            // _checkPersmission();
                            print(_loc);
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