import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/jrl_model.dart';

class JrlInfo extends StatefulWidget {
  JrlInfo({Key key}) : super(key: key);
  @override
  _JrlInfoState createState() => _JrlInfoState();
}

class _JrlInfoState extends State<JrlInfo> {

  String _time = ' -- ';
  num _inTemp = 1.0;
  num _mqPressure = 1.0;
  num _yskqPressure = 1.0;
  num _dqPressure = 1.0;
  num _rsPressure = 1.0;
  num _mqFlow = 1.0;
  num _zqFlow = 1.0;
  num _gpNumInYrd = 1.0;
  num _gpNumInJiard = 1.0;
  num _gpNumInJunrd = 1.0;
  num _gpNum = 1.0;

  @override
  void initState() {
    super.initState();
    getJrlInfo();
  }

  Timer _countdownTimer;  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;super.dispose();
  }

  Future<void> getJrlInfo() async {
    var response = await Dio().get("http://172.16.202.194:5050/api/SectionInfoManage/JrlZone");
    print(response.toString());
    Map dataMap = jsonDecode(response.toString());
    var jrl = JRLDetailsEntity.fromJson(dataMap);
//        print(dataMap);
    _countdownTimer = Timer.periodic(Duration(seconds: 2), (timer) {if (mounted){
      setState(() {
        _time = jrl.f_Time;
        _inTemp = jrl.f_InTemp;
        _mqPressure = jrl.f_MQPRESSURE;
        _yskqPressure = jrl.f_YSKQPRESSURE;
        _dqPressure = jrl.f_DQPRESSURE;
        _rsPressure = jrl.f_RSPRESSURE;
        _mqFlow = jrl.f_MQFLOW;
        _zqFlow = jrl.f_ZQFLOW;
        _gpNumInYrd = jrl.f_GPNUMINYRD;
        _gpNumInJiard = jrl.f_GPNUMINJIARD;
        _gpNumInJunrd = jrl.f_GPNUMINJUNRD;
        _gpNum = jrl.f_GPNUM;
        });
      }
    });
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
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('入炉温度：')
                                        ),
                                        SizedBox(
                                          width: 239.0,
                                          height: 20.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('燃气压力：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('压缩空气压力：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('氮气压力：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('软水压力：')
                                        ),
                                        SizedBox(
                                          width: 239.0,
                                          height: 20.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35,
                                            width: 239.0,
                                            child: Text('燃气瞬时流量：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('蒸汽瞬时流量：')
                                        ),
                                        SizedBox(
                                          width: 239.0,
                                          height: 20.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('预热段钢胚根数：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('加热段钢胚根数：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('均热段钢胚根数：')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 239.0,
                                            child: Text('炉内钢胚根数：')
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
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_inTemp')
                                        ),
                                        SizedBox(
                                          width: 261.0,
                                          height: 20.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_mqPressure')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_yskqPressure')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_dqPressure')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_rsPressure')
                                        ),
                                        SizedBox(
                                          width: 261.0,
                                          height: 20.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35,
                                            width: 261.0,
                                            child: Text('$_mqFlow')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_zqFlow')
                                        ),
                                        SizedBox(
                                          width: 261.0,
                                          height: 20.0,
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_gpNumInYrd')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_gpNumInJiard')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_gpNumInJunrd')
                                        ),
                                        Container(
                                            alignment: Alignment(-1.0, 0),
                                            height: 35.0,
                                            width: 261.0,
                                            child: Text('$_gpNum')
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
