import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/jzzone_model.dart';

class JzzoneInfo extends StatefulWidget {
  JzzoneInfo({Key key}) : super(key: key);
  @override
  _JzzoneInfoState createState() => _JzzoneInfoState();
}

class _JzzoneInfoState extends State<JzzoneInfo> {

  String _time = ' -- ';
  num _flgdSpeed = 1.0;
  num _flgdDl = 1.0;
  int _sbStatus = 0;
  int _jjStatus = 0;
  int _xjStatus = 0;
  num _sbDl = 1.0;
  num _sbSpeed = 1.0;
  num _jjDl  = 1.0;
  num _jjSpeed = 1.0;
  num _xjDl = 1.0;
  num _xjSpeed = 1.0;
  String sbStatus = ' -- ';
  String jjStatus = ' -- ';
  String xjStatus = ' -- ';

  @override
  void initState() {
    super.initState();
    getJzzoneInfo();
  }

//
//  void setSbStatus() {
//    if(_sbStatus == 0){sbStatus = ' 合未动 '; }
//    else if(_sbStatus == 1){sbStatus = ' 开未动 '; }
//    else if(_sbStatus == 2){sbStatus = ' 开 '; }
//    else if(_sbStatus == 3){sbStatus = ' 合 '; }
//  }
//
//  void setJjStatus(){
//    if(_jjStatus == 0){jjStatus = ' 静止待装钢 '; }
//    else if(_jjStatus == 1){jjStatus = ' 装钢 '; }
//    else if(_jjStatus == 2){jjStatus = ' 装钢移动 '; }
//    else if(_jjStatus == 3){jjStatus = ' 装钢静止待卸钢 '; }
//    else if(_jjStatus == 4){jjStatus = ' 卸钢 '; }
//    else if(_jjStatus == 5){jjStatus = ' 卸完钢静止 '; }
//    else if(_jjStatus == 6){jjStatus = ' 卸完钢复位 '; }
//  }
//
//  void setXjStatus(){
//    if(_xjStatus == 0){xjStatus = ' 静止待装钢 '; }
//    else if(_xjStatus == 1){xjStatus = ' 装钢 '; }
//    else if(_xjStatus == 2){xjStatus = ' 装钢移动 '; }
//    else if(_xjStatus == 3){xjStatus = ' 装钢静止待卸钢 '; }
//    else if(_xjStatus == 4){xjStatus = ' 卸钢 '; }
//    else if(_xjStatus == 5){xjStatus = ' 卸完钢静止 '; }
//    else if(_xjStatus == 6){xjStatus = ' 卸完钢复位 '; }
//  }

  Future<void> getJzzoneInfo() async {
    var response = await Dio().get("http://172.16.202.194:5050/api/SectionInfoManage/JzZone");
    print(response.toString());
    Map dataMap = jsonDecode(response.toString());
    var jzzone = JZZoneDetailsEntity.fromJson(dataMap);
//        print(dataMap);
    _countdownTimer = Timer.periodic(Duration(seconds: 2), (timer) {if (mounted){
      setState(() {
        _time = jzzone.f_TIME;
        _flgdSpeed = jzzone.f_FLGDSPEED;
        _flgdDl = jzzone.f_FLGDDL;
        _sbStatus = jzzone.f_SBSTATUS;
        _jjStatus = jzzone.f_JJSTATUS;
        _xjStatus = jzzone.f_XJSTATUS;
        _sbDl = jzzone.f_SBDL;
        _sbSpeed = jzzone.f_SBSPEED;
        _jjDl = jzzone.f_JJDL;
        _jjSpeed = jzzone.f_JJSPEED;
        _xjDl = jzzone.f_XJDL;
        _xjSpeed = jzzone.f_XJSPEED;
        if(_sbStatus == 0){sbStatus = ' 合未动 '; }
        else if(_sbStatus == 1){sbStatus = ' 开未动 '; }
        else if(_sbStatus == 2){sbStatus = ' 开 '; }
        else if(_sbStatus == 3){sbStatus = ' 合 '; }
        if(_jjStatus == 0){jjStatus = ' 静止待装钢 '; }
        else if(_jjStatus == 1){jjStatus = ' 装钢 '; }
        else if(_jjStatus == 2){jjStatus = ' 装钢移动 '; }
        else if(_jjStatus == 3){jjStatus = ' 装钢静止待卸钢 '; }
        else if(_jjStatus == 4){jjStatus = ' 卸钢 '; }
        else if(_jjStatus == 5){jjStatus = ' 卸完钢静止 '; }
        else if(_jjStatus == 6){jjStatus = ' 卸完钢复位 '; }
        if(_xjStatus == 0){xjStatus = ' 静止待装钢 '; }
        else if(_xjStatus == 1){xjStatus = ' 装钢 '; }
        else if(_xjStatus == 2){xjStatus = ' 装钢移动 '; }
        else if(_xjStatus == 3){xjStatus = ' 装钢静止待卸钢 '; }
        else if(_xjStatus == 4){xjStatus = ' 卸钢 '; }
        else if(_xjStatus == 5){xjStatus = ' 卸完钢静止 '; }
        else if(_xjStatus == 6){xjStatus = ' 卸完钢复位 '; }
        });
      }
    });
  }

  Timer _countdownTimer;  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 5.0),
            color:Colors.white,
            child:DefaultTextStyle(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontFamily: "SimSun",
                ),
                textAlign:TextAlign.left,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    textDirection: TextDirection.ltr,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      Expanded(
                          flex:1,
                          child: Column(
                              children: <Widget>[
                                Container(
                                    margin:EdgeInsets.only(left: 40.0, top:30),
                                    width: double.infinity,
                                    color: Colors.white,
                                    child:Column(
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('记录时间：')
                                        ),
                                        SizedBox(
                                          width: 239.0,
                                          height: 57.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('风冷辊道转速：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('风冷辊道电流：')
                                        ),
                                        SizedBox(
                                          width: 239.0,
                                          height: 30.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('集卷筒隔板状态：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('集卷小车：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('卸卷小车：')
                                        ),
                                        SizedBox(
                                          width: 239.0,
                                          height: 30.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35,
                                            width: 239.0,
                                            child: Text('双臂电流：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('双臂速度：')
                                        ),
                                        SizedBox(
                                          width: 239.0,
                                          height: 30.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('集卷小车速度：')
                                        ),
                                      ],
                                    )
                                )
                              ]
                          )
                      ),
                      Expanded(
                          flex:1,
                          child: Column(
                              children: <Widget>[
                                Container(
                                    margin:EdgeInsets.only( top:30),
                                    width: double.infinity,
                                    color: Colors.white,
                                    child:Column(
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_time')
                                        ),
                                        SizedBox(
                                          width: 261.0,
                                          height: 57.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_flgdSpeed')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_flgdDl')
                                        ),
                                        SizedBox(
                                          width: 261.0,
                                          height: 30.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$sbStatus')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$jjStatus')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$xjStatus')
                                        ),
                                        SizedBox(
                                          width: 261.0,
                                          height: 30.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35,
                                            width: 261.0,
                                            child: Text('$_sbDl')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_sbSpeed')
                                        ),
                                        SizedBox(
                                          width: 261.0,
                                          height: 30.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_jjSpeed')
                                        ),
                                      ],
                                    )
                                )
                              ]
                          )
                      ),
                    ]
                )
            )
        )
    );
  }
}

